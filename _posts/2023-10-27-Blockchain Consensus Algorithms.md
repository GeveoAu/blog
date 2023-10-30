---

title: Blockchain Consensus Algorithms.
author: Asanka Indrajith.
linkedin: https://www.linkedin.com/in/asanka-indrajith/

description: Blockchain technology has revolutionized the way transactions are carried out, offering a decentralized and secure way to store and transfer information. Blockchain offers a distributed decentralized network that provides immutability, privacy, security, and transparency. There is no central authority present to validate and verify the transactions, yet every transaction in the Blockchain is considered to be completely secured and verified. But then who governs this network and verifies every transaction, provided there is no centralized authority? This is possible through a consensus mechanism through which all the peers of the Blockchain network reach a common agreement about the present state of the distributed ledger. 

---
___

<img src="/img/ai_1_2023_10_27.png" height="640 px" width="948 px"  />

Blockchain technology has revolutionized the way transactions are carried out, offering a decentralized and secure way to store and transfer information. Blockchain offers a distributed decentralized network that provides immutability, privacy, security, and transparency. There is no central authority present to validate and verify the transactions, yet every transaction in the Blockchain is considered to be completely secured and verified. But then who governs this network and verifies every transaction, provided there is no centralized authority? This is possible through a consensus mechanism through which all the peers of the Blockchain network reach a common agreement about the present state of the distributed ledger. 

So, a consensus algorithm is an algorithm that is a set of rules or protocols that enable blockchain networks to achieve this agreement. Essentially, the consensus protocol makes sure that every new block that is added to the Blockchain is the one and only version of the truth that is agreed upon by all the nodes in the Blockchain. It is responsible for maintaining the integrity of the blockchain by ensuring that no single node or group of nodes can manipulate the network. Therefore, a consensus algorithm consists of some specific objectives such as coming to a unified agreement, collaboration, cooperation, equal rights to every node, and mandatory participation of each node in the consensus process. Now, let’s look into various consensus algorithms and how they work.

**1.	Proof of Work (PoW)**

Proof of Work was first introduced by Bitcoin’s creator Satoshi Nakamoto, is the oldest consensus mechanism used in the Blockchain domain. The PoW algorithm requires miners (participating nodes) to solve complex mathematical problems, known as hashes, in order to validate transactions and add new blocks to the chain. The hash function used in PoW algorithms is designed to be computationally difficult to solve, which means that it requires a significant amount of computational power to solve the problem and add a block to the chain. Miners compete with each other to solve the problem, and the first one to solve it is rewarded with newly minted cryptocurrency.

**2.	Proof of Stake (PoS)**

This is the most common alternative to PoW. Unlike Proof of Work (PoW), which requires miners to solve complex mathematical problems, PoS relies on validators who hold a certain amount of cryptocurrency to validate transactions and add new blocks to the chain. Validators invest in the coins of the system by locking up some of their coins as stakes. After that, all the validators will start validating the blocks. Validators will validate blocks by placing a bet on them if they discover a block that they think can be added to the chain. Based on the actual blocks added in the Blockchain, all the validators get a reward proportionate to their bets, and their stake increases accordingly. Ethereum has shifted from PoW to PoS consensus.
There are two popular variations of Proof of Stake (PoS).

  ***a.	Delegated Proof of Stake (DPoS)***

DPoS is a variation of Proof of Stake (PoS) that relies on a smaller group of validators, known as delegates or witnesses, to validate transactions and add new blocks to the chain. The users delegate their votes to other delegate users. Whichever user who mines the block will distribute the rewards to the users who delegated to that particular vote. The delegates also get rewarded in the form of transaction fees or a certain number of coins. Some of the real-life use cases of DPoS are Steem, EOS, and BitShares.

  ***b.	Leased Proof of Stake (LPoS)***

In LPoS, users(token holders) lease their tokens to a validator, who uses those tokens to increase their stake and improve their chances of being selected to validate transactions and add new blocks to the chain. The token holder retains ownership of their tokens and receives a share of the rewards earned by the validator in proportion to the amount of tokens they leased.

**3.	Proof of Authority (PoA)**

Proof of Authority is a modified version of Proof of Stake in which the identities of validators in the network are at stake. In PoA, a group of validators is designated as authoritative and responsible for validating transactions and adding new blocks to the chain. Validators are typically selected based on their reputation and expertise, and they are incentivized to act honestly because their reputation is on the line.

**4.	Byzantine Fault Tolerance (BFT)**

Byzantine Fault Tolerance, as the name suggests, is used to deal with Byzantine fault (also called Byzantine Generals Problem). “Byzantine Generals Problem,” a theoretical scenario in which a group of generals must coordinate an attack on a city, but some of the generals are traitors who may send false information to others. In a blockchain network, the Byzantine Generals’ Problem can manifest as nodes on the network that behave maliciously or fail to communicate correctly. BFT addresses this problem by requiring a certain percentage of nodes to agree on the validity of transactions before they are added to the blockchain. 
There are two variations of the BFT consensus model that are used in the Blockchain arena.

  ***a.	Practical Byzantine Fault Tolerance (PBFT)***

In PBFT, each node confirms the messages that have been delivered to them by performing a computation to evaluate the decision about the message’s validity. Then announces its decision to other nodes who ultimately process a decision over it. This way, the final decision relies upon the decisions retrieved from the other nodes. Stellar, Hyperledger Fabric, Ripple and Evernode (HotPocket) are some use cases of this blockchain consensus mechanism. 



  ***b.	Delegated Byzantine Fault Tolerance (DBFT)***

Introduced by NEO, DBFT uses a delegated model where network participants delegate their voting power to a smaller number of trusted nodes(validators). Validators are responsible for verifying transactions and reaching a consensus on the validity of transactions. One among those validators is then chosen as speaker randomly. The speaker creates a new block from the transaction that is waiting to be validated. Also, he sends a proposal to the voted delegates who have the responsibility to supervise all the transactions and record them on the network. These delegates have the freedom to share and analyze the proposals to check the accuracy of data and honesty of the speaker. If then, 2/3rd of the delegates validates it, the block is added to the blockchain.

**5.	Proof of Capacity (PoC)**

PoC is similar to Proof of Work (PoW) in that it requires participants to solve a computational puzzle to add new blocks to the blockchain, but it differs in how it utilizes computer storage rather than computational power. Users can use storage to produce blocks, in a way that those who are fastest in evaluating the solutions get better chances for creating blocks. T he more hard drive space validators have, the better their chances of getting selected for mining the next block and earning the block reward.

**6.	Proof of Burn (PoB)**

PoB requires participants to burn, or destroy, cryptocurrency tokens to prove their commitment to the network. But, in order to burn coins, they are required to send it to an unreachable address where it couldn’t be spent verifying the block. The more coins they burn, the more are the chances of picking a new block for every coin they get.

**7.	Proof of Elapsed Time (PoET)**

PoET was introduced by Intel with an intent to take over cryptographic puzzles involved in PoW mechanism by considering the fact that the CPU architecture and the quantity of mining hardware knows when and at what frequency a miner wins the block. In PoET, each participant in the network is assigned a random waiting time, similar to a lottery. Participants compete to be the first to finish their wait time, and the first to do so is granted the right to create the next block. 



There also exist other consensus algorithms like Proof of Identity, Proof of Activity, Proof of Weight, Proof of Importance, Directed Acyclic Graph, etc. In conclusion, selecting the right consensus algorithm is a critical decision when designing a blockchain network. Each consensus algorithm has its own strengths and weaknesses and choosing the wrong one can have severe consequences on the network’s security, decentralization, and performance. Therefore, it is important to wisely pick the one according to the business network necessity as the Blockchain networks can’t work properly without the consensus algorithms to confirm every single transaction that is being committed.


**References**

https://www.geeksforgeeks.org/consensus-algorithms-in-blockchain/
https://appinventiv.com/blog/blockchain-consensus-algorithms-guide/
https://medium.com/@learnwithwhiteboard_digest/all-major-blockchain-consensus-algorithms-explained-6934b4f5d47a 
