---
title: Blockchain Consensus Mechanism
author: Priyadharsun Sivadasan
linkedin: https://lk.linkedin.com/in/priyadharsun-sivadasan-a1676247
description : Blockchain, Consensus
---

Blockchain is a secure, shared, distributed ledger that is used to maintain a continuously growing list of records, called blocks. 

* Secure - Each transaction is secured with cryptography. Cryptography is the fundamental building block based on which blockchain has been developed.

* Shared - The database is shared between parties (peer-to-peer) without the need for any intermediary to verify the authenticity of the records of the database, thereby not needing a central authority to be trusted.

* Distributed - The blockchain database is distributed with multiple replicas of the same database. This also means that the trust in the data is also distributed.

* Ledger - A ledger where you can only write and cannot alter records once written. The blockchain database can only be appended with immutable records of each transaction and time-stamped. The transactions are recorded in the shared ledger in a secure and verifiable way, reducing the chances of someone tampering with the records.

In a centralized organization, all the decisions are taken by the central party or a board of decision makers. This isn’t possible in a blockchain because a blockchain has no "central party". For the blockchain to make decisions, they need to come to a consensus using “consensus mechanisms”.

**Consensus Mechanisms**

Consensus mechanisms are protocols that make sure all nodes (devices on the blockchain) are synchronized with each other and agree on which transactions are legitimate and are added to the blockchain. This also verifies each and every transactions and makes sure everyone uses the same blockchain. 

There are many ways to reach consensus, here we will discuss most famous mechanisms.

**Proof of Work (POW)**

This is known as mining and the nodes are known as miners. The miners solve cryptographic puzzles to "mine" a block in order to add to the blockchain. It is not possible to solve the puzzles quicker using any other method than trial and error. This also means that the if one wants to find the solution to the puzzle faster, they would need more computational power, which can get very costly. When a miner solves the puzzle, they present their block to the network for verification. Verifying whether the block belongs to the chain or not is an extremely simple process.

**Proof of Stake (POS)**

Proof of stake will make the entire mining process virtual and replace miners with validators. The validators will have to lock up some of their coins as stake. After that, they will start validating the blocks. Meaning, when they discover a block which they think can be added to the chain, they will validate it by placing a bet on it. If the block gets appended, then the validators will get a reward proportionate to their bets.

**Delegated Proof of Stake (DPOS)**

This is a very fast consensus mechanism where users can stake their coins to vote for a certain amount of delegates. The weight of their vote depends on their stake, for example, if A stakes 10 coins for a delegate and B stakes 1 coin for a delegate, A’s vote weighs 10 times heavier than B’s vote. A delegate is a person or organization that wants to produce blocks on the network. The delegates that receive the highest amount of votes get to produce blocks and are rewarded for creating these blocks. Just like with POS, they are either paid from the transaction fees or they are paid a fixed amount of coins, which are created through inflation.

**Proof of Activity (POA)**

It is a combination of POW and POS. In proof of activity, mining starts like POW, with miners racing to solve a cryptographic puzzle. Depending on the implementation, blocks mined do not contain any transactions (they are more like templates), so the winning block will only contain a header and the miner’s reward address.

At this point, the system switches to POS. Based on information in the header, a random group of validators is chosen to sign the new block. The more coins in the system a validator owns, the more likely he or she is to be chosen. The template becomes a full-fledged block as soon as all of the validators sign it.

If some of the selected validators are not available to complete the block, then the next winning block is selected, a new group of validators is chosen, and so on, until a block receives the correct amount of signatures. Fees are split between the miner and the validators who signed off on the block.

Criticisms of proof of activity are the same as for both proof of work (too much energy is required to mine blocks) and proof of stake (there is nothing to deter a validator from double signing).

**Proof of Capacity (POC)**

With POW miners use computational to guess the correct solution, with POC however, solutions are pre-stored in digital storages (like hard disks). This process is called plotting. After a storage has been plotted (meaning it has been filled with solutions) it can take part in the block creation process. Whoever has the fastest solution to the puzzle of a (new) block, gets to create the new block. The more storage capacity you have, the more solutions you can store, the higher your odds of creating a block are.

**Proof of Elapsed Time (POET)**

In this mechanism, to decide who gets to produce a block, the process assigns a random wait time to each node. The node whose wait time finishes first gets to produce the next block. This consensus mechanism can only work if there is a system in place to verify that nobody can run multiple nodes and that the assigned waiting time is actually random. Without a system like this in place the consensus mechanism has major flaws.

**Proof of Burn (POB)**

POB is an alternative consensus algorithm to POW that tries to address the energy consumption issue. POB is often called POW without energy waste. It works on the principle of allowing the miners to "burn" or “destroy” the virtual currency tokens, which grants them the right to write blocks in proportion to the coins burnt. To burn the coins, miners send them to a verifiably un-spendable address. This process does not consume many resources other than the burned coins and ensures that the network remains active and agile. Depending upon the implementation, miners are allowed to burn the native currency or the currency of an alternative chain, such Bitcoin. In exchange, they receive a reward in the native currency token of the blockchain.

At the end we say that all the Consensus Mechanisms have the same goal, which is to reaching consensus in a decentralized network. But they have their own Pros and Cons in their varying approaches. The perfect mechanism doesn’t exist yet. But it is very interest to read and understand how these Consensus mechanisms evolved and it will you some new ideas as well.

