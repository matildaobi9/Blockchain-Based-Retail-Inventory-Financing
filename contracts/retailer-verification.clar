;; Retailer Verification Contract
;; This contract validates legitimate business operations

;; Define data variables
(define-data-var admin principal tx-sender)
(define-map retailers principal {
    verified: bool,
    business-name: (string-utf8 100),
    business-id: (string-utf8 50),
    registration-date: uint
})

;; Error codes
(define-constant ERR_NOT_AUTHORIZED u1)
(define-constant ERR_ALREADY_VERIFIED u2)
(define-constant ERR_NOT_FOUND u3)

;; Check if caller is admin
(define-private (is-admin)
    (is-eq tx-sender (var-get admin))
)

;; Register a new retailer (admin only)
(define-public (register-retailer (retailer principal) (business-name (string-utf8 100)) (business-id (string-utf8 50)))
    (begin
        (asserts! (is-admin) (err ERR_NOT_AUTHORIZED))
        (asserts! (is-none (map-get? retailers retailer)) (err ERR_ALREADY_VERIFIED))

        (map-set retailers retailer {
            verified: false,
            business-name: business-name,
            business-id: business-id,
            registration-date: block-height
        })

        (ok true)
    )
)

;; Verify a retailer (admin only)
(define-public (verify-retailer (retailer principal))
    (begin
        (asserts! (is-admin) (err ERR_NOT_AUTHORIZED))

        (match (map-get? retailers retailer)
            retailer-data (begin
                (map-set retailers retailer (merge retailer-data { verified: true }))
                (ok true)
            )
            (err ERR_NOT_FOUND)
        )
    )
)

;; Revoke verification (admin only)
(define-public (revoke-verification (retailer principal))
    (begin
        (asserts! (is-admin) (err ERR_NOT_AUTHORIZED))

        (match (map-get? retailers retailer)
            retailer-data (begin
                (map-set retailers retailer (merge retailer-data { verified: false }))
                (ok true)
            )
            (err ERR_NOT_FOUND)
        )
    )
)

;; Check if a retailer is verified
(define-read-only (is-verified (retailer principal))
    (default-to false (get verified (map-get? retailers retailer)))
)

;; Get retailer information
(define-read-only (get-retailer-info (retailer principal))
    (map-get? retailers retailer)
)

;; Transfer admin rights (admin only)
(define-public (transfer-admin (new-admin principal))
    (begin
        (asserts! (is-admin) (err ERR_NOT_AUTHORIZED))
        (var-set admin new-admin)
        (ok true)
    )
)
