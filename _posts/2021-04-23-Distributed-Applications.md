---

title: Distributed Applications 

author: Savinda Senevirathne

linkedin: https://www.linkedin.com/in/savindasenevirathne/

description : Distributed applications (Dapp) are applications run on multiple nodes talking to each other executing the same task or job at the same time. All the application’s decisions are based on majority voting. Due to the multi node nature, transactional data are duplicated in every node. So, in order to a data modification to take effect, the data must be changed in majority of nodes at the same time and the relevant blockchain also should be updated to match the modified data. This is near impossible due to the computational complexity and the smaller time window. 

---
___

What do you know about an enterprise application architecture? Most of the average people think that a simple server and client connecting to it. That is our basic understanding. This is called a centralized application architecture where there is only one point which controls all the system and sits above all. (God figure in that application. Ha ha). But there is a side most of us can’t see. That is that if that server is attacked or become vulnerable, all the decisions made by the system after that becomes vulnerable. 

Think of a similar scenario. All of us have bank accounts. Think of a situation that all the data is stored in a centralized architecture. So, a hacker only needs to get into that server and change your account balance. (Think that this bank has no any other security mechanisms like firewalls). That’s it. You are poor or richer after that.  That is where a distributed application gets into rescue. Details of distributed applications will be discussed in this post here after.
.

#### **What is Distributed Applications**

Distributed applications (Dapp) are applications run on multiple nodes talking to each other executing the same task or job at the same time. All the application’s decisions are based on majority voting. 

Due to the multi node nature, transactional data are duplicated in every node. So, in order to a data modification to take effect, the data must be changed in majority of nodes at the same time and the relevant blockchain also should be updated to match the modified data. This is near impossible due to the computational complexity and the smaller time window. 

“A blockchain is a digital record of transactions. The name comes from its structure, in which individual records, called blocks, are linked together in single list, called a chain.” 
 
#### **Why Dapp**

If we are using a centralized application, we have to trust the third party managing the server. If we are using a distributed application, there is no centralized authority to control. Peer nodes talk with each other and take decisions. 

Let's talk about the bank example I took in the introduction. The hacker was able to change your account balance because he/she has to change only one server’s data. But in a distributed application, he/she has to hack majority servers and do the changes. That itself increase the safety of the data. The integrity of the data is checked by checking the integrity of blockchain the distributed application uses. The blockchain should be exactly the same in all the nodes all the time. 


#### **Pros and Cons of Dapps**

#### **Advantages**

**Reliability** 

Distributed applications are more reliable since the application is running on more than one node. So, every operation should be identical in every node to be trusted and sent back to the original client.  

**Integrity** 

This history of how the distributed application is saved in a data structure called a blockchain. It is made of similar blocks called ledger blocks which is linked to each other. For a beginner this is somewhat similar to a linked list. (How the blocks are linked). Due to this linked nature, in case of security breach, the hacker has to change all the data from the point he wants up to the recent within a smaller amount of time in majority of nodes to make that change permanent. This is near impossible due to computational complexity. 

**Fail Safe**

In most of the centralized systems, there is only one server to serve incoming requests. That means only one point of failure. Some systems deploy multiple servers to handle larger loads. The incoming request is not served if the server is down. But in case of a distributed system, the client has the ability to take responses from multiple servers. The system is stable as long as the minimum required servers are running to meet majority. 

#### **Disadvantages**

**Difficult troubleshooting**

Trouble shooting can get difficult due to distributed nature in addition to the own software complexity. 

**High network infrastructure cost** 

Distributed systems should deploy more than one instance of the application whereas only one instance is enough in centralized systems. Bandwidth and data consumption will be higher due to added peer to peer communication.

#### **Examples**

**MakerDAO**

A decentralized credit service that runs on the Ethereum blockchain platform, MakerDAO supports Dai, a stable coin whose value is pegged to the U.S. dollar. 

**Chainlink** 

This secure middleware is promoting an open standard for a secure, decentralized data input or “oracle” system that validates information from external feeds. In short, Chainlink offers any smart contract secure access to data feeds, APIs and payments. 

**TRACEDonate** 

This identity management platform is designed to allow for transparent and traceable cross-border remittances and giving. This connects charitable organizations and donors to beneficiaries. It hopes to give donors peace of mind that their funds will be used for the intended purposes by those in need, whether it’s for buying groceries or utilities, rather than alcohol, etc. 

**Circulor** 

This is a Dapp offering supply chain traceability, in this case for the electric vehicle and electronics industries. It provides traceability to demonstrate the ethical and sustainable sourcing of raw materials used in the production of the latter. 

#### **References**

- https://www.jrebel.com/blog/distributed-application  
- https://techterms.com/definition/blockchain  
- https://www.computerworld.com/article/3510457/10-top-distributed-apps-dapps-for-blockchain.html  
