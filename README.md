# Cross-Chain Token Bridge Logic

This repository provides a professional Solidity implementation of a cross-chain bridge architecture. It focuses on the smart contract side of the "Lock/Mint" and "Burn/Unlock" patterns used by major interoperability protocols.

## Bridge Architecture
The bridge operates on two distinct networks (Source and Destination):
1. **Source Chain (Locking):** Users lock their native tokens into the `Bridge` contract.
2. **Relayer/Oracle:** An off-chain service monitors the `Locked` event.
3. **Destination Chain (Minting):** The bridge contract on the destination chain mints a "Wrapped" version of the token for the user.



## Features
* **Atomic Locking:** Securely locks assets and emits structured data for relayers.
* **Wrapped Token Support:** Integrated ERC20 logic for minting pegged assets.
* **Access Control:** Restricted minting permissions to ensure only authorized bridge roles can create tokens.
* **Burn-to-Unlock:** Logic for returning to the native chain by burning wrapped assets.

## Implementation Details
The repository uses a flat structure to keep the logic clear and accessible for developers studying cross-chain messaging and liquidity movement.

## License
MIT
