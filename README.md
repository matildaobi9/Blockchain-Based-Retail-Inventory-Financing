# Blockchain-Based Retail Inventory Financing

A decentralized system for retail inventory financing using blockchain technology. This project enables retailers to use their inventory as collateral for loans, with transparent verification, certification, and monitoring.

## Overview

This system consists of four main smart contracts that work together to create a secure and transparent inventory financing platform:

1. **Retailer Verification Contract**: Validates legitimate business operations
2. **Inventory Certification Contract**: Confirms existence and value of stock
3. **Loan Management Contract**: Handles terms and repayment schedules
4. **Collateral Monitoring Contract**: Tracks inventory levels during loan period

## Smart Contracts

### Retailer Verification Contract

This contract manages the verification of retailers who wish to participate in the financing program.

Key functions:
- `register-retailer`: Registers a new retailer (admin only)
- `verify-retailer`: Verifies a registered retailer (admin only)
- `revoke-verification`: Revokes verification from a retailer (admin only)
- `is-verified`: Checks if a retailer is verified

### Inventory Certification Contract

This contract manages the certification and tracking of inventory items.

Key functions:
- `add-inventory-item`: Adds a new inventory item
- `update-inventory-item`: Updates an existing inventory item
- `remove-inventory-item`: Removes an inventory item
- `get-inventory-item`: Gets details of a specific inventory item
- `get-retailer-inventory-value`: Gets the total value of a retailer's inventory

### Loan Management Contract

This contract manages the creation and repayment of loans.

Key functions:
- `create-loan`: Creates a new loan
- `make-repayment`: Makes a repayment on an existing loan
- `mark-loan-defaulted`: Marks a loan as defaulted
- `calculate-total-due`: Calculates the total amount due for a loan
- `get-loan`: Gets details of a specific loan

### Collateral Monitoring Contract

This contract monitors the collateral status of active loans.

Key functions:
- `initialize-monitoring`: Initializes monitoring for a loan
- `update-collateral-status`: Updates the collateral status of a loan
- `get-collateral-status`: Gets the current collateral status of a loan
- `is-collateral-sufficient`: Checks if the collateral is sufficient

## Testing

The project includes comprehensive tests for all smart contracts using Vitest. The tests cover:

- Retailer registration and verification
- Inventory item management
- Loan creation and repayment
- Collateral monitoring and status updates

To run the tests:

\`\`\`bash
npm test
\`\`\`

## Development

### Prerequisites

- Clarity development environment
- Node.js and npm for testing

### Installation

1. Clone the repository
2. Install dependencies:
   \`\`\`bash
   npm install
   \`\`\`

### Deployment

1. Deploy the contracts in the following order:
    - Retailer Verification
    - Inventory Certification
    - Loan Management
    - Collateral Monitoring

2. Initialize the contracts with appropriate parameters

## License

This project is licensed under the MIT License - see the LICENSE file for details.
