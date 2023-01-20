---

title: Securing APIs and Microservices in the Cloud

author: Sachini Karunarathne

linkedin: https://www.linkedin.com/in/sachini-karunarathne-908135199/

description: The data center edge, the hardware and software stack that links web applications to the Internet and the point at which a customer first interacts with an organization's business services, has evolved as a result of the growth of web applications. Simple hardware load balancers have given way to a whole stack of hardware and software proxies at the edge, including API Gateways, CDNs, and load balancers. 

---
___
The data center edge, the hardware and software stack that links web applications to the Internet and the point at which a customer first interacts with an organization's business services, has evolved as a result of the growth of web applications. Simple hardware load balancers have given way to a whole stack of hardware and software proxies at the edge, including API Gateways, CDNs, and load balancers.

#### **The Journey of the Cloud-Native Era**

<img src="/img/sk_1_2023_01_20.png" height="398 px" width="673 px"  />

Sharing the innovations and discoveries of the broader technology community inspired the development of early API gateways. A common façade for the whole application was produced by an API gateway, which carried out the routing functionality that was in the original monolith. The API gateway served as the core location for centralized cross-cutting application-level functions such rate limitation, authentication, and routing. As a result, fewer redundant features were needed in each of the separate services.

We live and work in a cloud-native world today. The development of microservices is essential to the cloud-native age. The addition of microservices to application architecture is another change. Every microservice in an application represents a stand-alone business function, and each one is created and delivered separately from the others. Microservices provide enterprises the ability to expand their software development processes more effectively for the cloud by decoupling development cycles.

Given the variety of settings in which microservices may be deployed—including virtual machines, bare metal, containers, and as functions—API gateways are essential for directing traffic to the appropriate microservice.

#### **Security of Microservices**

Since microservices interact via API calls, when you split your monolith architecture into a microservices architecture, you end up with multiple microservices. And here comes a bunch of questions which are highly significant.

- whose property is security?
- What role does security play here? 
- Do you engage in secure design? 
- As you develop these APIs, do you consider security?

As shown in the accompanying graphic, there are two layers of security that need to be provided in a typical microservices-based application.

<img src="/img/sk_2_2023_01_20.png" height="398 px" width="673 px"  />

A messaging platform is used to implement inter-service communication in the previous illustration. As a result, the message platform and the microservice are secured for east-west traffic. In the absence of such a messaging platform, security must be implemented at the microservices layer. We'll assume for the sake of this essay that your design includes a message platform for inter-service communication.   

#### **Securing north-south traffic (external consumers)**

Different strategies may be used to establish security for north-south transportation. The three methods listed below are widely used in the business sector.
    
 1. Implement security at each microservice level.

<img src="/img/sk_3_2023_01_20.png" height="398 px" width="673 px"  />
 2. Implement security using a sidecar.

<img src="/img/sk_4_2023_01_20.png" height="398 px" width="673 px"  />
 3. Implement security using a shared gateway.

<img src="/img/sk_5_2023_01_20.png" height="398 px" width="673 px"  />

#### **Securing the east-west traffic**

Different security considerations might be made for inter-service communication when compared to external consumer traffic (north-south). It is often acceptable to use merely the necessary degree of security rather than hard security for this when both the consumer and the supplier live in an internal secured network. However, it relies on the corporate platform's security requirements and general security standards. With the following methods, we may provide security for east-west traffic.

1. Transport layer security.

<img src="/img/sk_6_2023_01_20.png" height="398 px" width="673 px"  />
2. Transport layer security with message layer security using authentication.

<img src="/img/sk_7_2023_01_20.png" height="398 px" width="673 px"  />
3. Transport layer security with message layer security using authentication and authorization.

<img src="/img/sk_8_2023_01_20.png" height="398 px" width="673 px"  />

#### **Summary**
If you consider the individuals that make up an organization, you won't post everyone's contract on the open Google Drive. HR may have access to that, and a user might read a contract, for instance. Thinking about who can do what and how is highly prevalent. Finally, since security is a shared duty, it is best to consider how you personally may contribute to reducing attack surfaces.






