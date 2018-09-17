---
title: Multichain
author: Nadeeshani Dayarathna
linkedin: https://www.linkedin.com/in/nadeeshanikaushalya/
description : multichain, blockchain
---

## Open source blockchain platform


Multichain is a private blockchain platform, which is open for creation and deployment of blockchain applications. It solves most of the drawbacks in public blockchains. Today Bitcoin is the most popular public blockchain platform. However, there are hundreds of public blockchains other than Bitcoin. Some of them are Ethereum, LISK, Litecoin, Namecoin, Nxt and BitShares. Each of these blockchains has its own cryptocurrency, network topology and mining algorithms.

## Features of Multichain

Multichain provides a set of features to overcome the existing drawbacks with blockchains. Those are permissions, assets and streams. Permissions ensure that the multichain’s activity is only visible to chosen participants. Streams provide a natural abstraction for blockchain use cases, which focus on general data retrieval, timestamping and archiving. Assets supports creation of multiple cryptocurrencies within blockchain.  Offers provide decentralized exchange at blockchain level. In addition, multichain has round robin mining algorithm to take place mining securely without proof of work and its associated costs. 

### Permissions

Multichain uses public key cryptography to manage identity and security. Users randomly generate their own private keys and never reveal them to other participants. Each private key has a mathematically related public address, which represents an identity for receiving funds. Once sent to a public address, those funds can only be spent using the corresponding private key to sign a new transaction. In multichain, there are eight types of global permissions that can be granted to addresses. 

* Connect - connect to other nodes and see the blockchain’s contents. 

* Send - send funds (sign inputs of transactions). 

* Receive - receive funds.

* Issue - issue assets (sign inputs of transactions which create new native assets). 

* Create - create streams (sign inputs of transactions which create new streams). 

* Mine - mine blocks (sign the metadata of transactions). 

* Activate - change connect, send and receive permissions for other users.

* Admin change all permissions for other users, including issue, mine, activate and admin. 

All permissions are assigned on a per-address basis. 

### Assets

Users can issue their own cryptocurrency using Multichain Assets. Those who can issue permissions can create assets with identifier (name) and quantifier (amount). In addition, users can update value of quantifier ant time. The identifiers and quantities of assets are encoded within each transaction output. Every multichain node tracks and verifies the quantity of assets in transactions. Specifically, it checks that the total quantities of all assets in a transaction’s outputs are exactly matched by the total in its inputs. Multichain allows each transaction output can contain any number of different assets.

### Streams

Streams are focused on retrieving, timestamping and archiving data. Streams can be used to implement three different types of databases on a chain. It can be used as a key-value database or document store, in the style of NoSQL. Each stream item is saved with timestamp. So, it can be used as a time series database, which focuses on the ordering of entries. Also, it is an identity-driven database where entries are classified according to their author. These can be considered as the ‘what’, ‘when’ and ‘who’ of a shared database.

Those streams have four main characteristics;

* Data - Data range from a small piece of text to many megabytes of raw binary

* Key - A key for later retrieval of data

* Publisher - One or more publishers who have digitally signed an item

* Timestamp - Taken from the header of the block in which the item is confirmed

 

Each item in a stream is represented by a blockchain transaction. Users who has create permissions can create streams. When a stream is created, it is open or closed. Open streams are writeable by anybody who has permission to send a blockchain transaction, while closed streams are restricted to a changeable list of permitted addresses. In multichain, each node decides which streams to subscribe to, and can ignore the data contained by others.

Each blockchain has an optional ‘root’ stream for initial data storing purposes, which is defined in its parameters and exists from the moment the chain is created. Streams provide a natural way to support encrypted data on a blockchain. 

References

1. D. G. Greenspan, "MultiChain Private Blockchain — White Paper," Coin Sciences Ltd, 2015.

2. https://www.multichain.com

