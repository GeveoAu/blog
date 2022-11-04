---

title: Introduction to Azure Service Bus Queues and Topics

author: Dilina Hirantha

linkedin: https://www.linkedin.com/in/dilinahirantha/

description: Azure Service Bus Queues and Topics can be used to implement asynchronous communication and improve durability. A queue is often used for point-to-point communication, whereas a topic is useful in multi-receiver scenarios

---
___


When we talk about modern messaging services, Microsoft Azure messaging services take a vital place in between current enterprise cloud messaging services. There, Microsoft Azure provides three different types of messaging services Azure Service Bus, Event Hub, and Event Grid.


From the above three types here we after we planned to continue the blog with the Azure Service Bus. Azure Service Bus Ques and topics. Azure Service Bus is a messaging service that relies on the cloud which is used to keep the connection between any applications, devices, and services running in the cloud to any other application or service. Service bus act as a physical postal service where data is delivered in different message formats like JSON, XML, and text even if the parties do not know each other. 


Azure Service Bus Queues is a messaging protocol that works asynchronously. It works in the simplest way where the message sender delivers a message to the queue that will be residing in a Service Bus Namespace.  The namespace is a scoping container for all messaging components where multiple queues and topics can reside in a single namespace. Then, those messages in the queue will receive by the receiver. Also, message in the queue is processed in the FIFO (First-In-First-Out) way and messages will stay inside the queue until the receiver asks for them. Mainly Azure service buses are used to have between one-to-one entities.


<img src="/img/dh_1_2022_11_4.jpg.png" height="191 px" width="786 px"  />

Azure Service Bus topics are pretty much the same as the queues, but it varies on one factor where topics can have one or more independent subscriptions. Topics can have zero or more subscriptions, but one subscription can only register with one topic. In contrast to the queues, topics and subscriptions provide one-to-many communications using publish and subscribe patterns. When a message is published on the topic, a copy of that message will receive for each subscription registered to that topic. There, subscriptions can have different filters where they can filter out the messages to receive. Therefore, consumers will not receive the messages directly from the topics, instead of topic subscriptions resembles virtual queues inside them from the copy of message received from their subscribed topic.


<img src="/img/dh_2_2022_11_4.jpg.png" height="191 px" width="786 px" />

#### **Key difference**

The main difference is consumer options where queues can have multiple receivers, but each message will be received by only one of the receivers. But, in the topics, there can be multiple receivers as subscribers and a copy of each message will be sent to any number of subscribers who listen to it.
When we consider message filtering between both types, queues do not need a specific filtering option because the message will be sent to only one receiver. But topic subscribers can have a variety of filters where the message will copy to the subscription virtual queue if and only if the message meets the filter requirements. 
The scalability of queues is less than the topics. There we increase the number of subscribers to topics instead of adding topics. Also, both queues and topics support peekLock and receiveAndDelete modes which ensure the message is processed before being dismissed if require. 
As for the use cases, if you need messages passing through a one-to-one system, then you should go with Azure service bus queues. Also, if you need to work with multiple systems (receivers) then should go with the Azure service bus topics.

