---
title: Azure Event Grid Vs. Azure Service Hub
author: Sandun Perera
linkedin: https://www.linkedin.com/in/sandunangelo/
description: Azure messaging platforms are popular in microservices setups and often act as the main way systems talk to each other. It's important to look at what your system really needs to figure out which platform is the best fit. Choosing the right one can make a big difference in how smoothly everything runs. 

---
___

### **Introduction**

Azure messaging platforms are popular in microservices setups and often act as the main way systems talk to each other. It's important to look at what your system really needs to figure out which platform is the best fit. Choosing the right one can make a big difference in how smoothly everything runs. 

#### **Trending messaging platforms**
- Azure Event Grid
- Azure Service Bus 
- Azure Notification Hub 
- WSO2 Enterprise Service Bus 
- Apache Kafka 

### **Azure Event Grid**

Azure uses a publish-subscribe model which is all about event-based message passing, making it a cozy fit for anyone into reactive programming. Here's how it works: the publisher just sends out messages and then forgets about them. It's up to the subscriber to pick and choose which events to handle. This setup is deeply integrated with Azure services, which smooths out integrating with third-party services too. 

One of the cool things is that you don’t have to keep checking for updates; the system avoids traditional polling, making event consumption a lot simpler. It's also designed to route events effectively and efficiently. Plus, since Event Grid is a global resource, there are no regional limitations to worry about. And by design, it can push messages to a large number of subscribers without breaking a sweat. This makes managing and scaling communications super streamlined. 


### **Azure Service Bus**

Azure works on a push-pull model and is really geared towards transactional messaging. The Service Bus, for example, is tied to a specific region, so it’s only available within that designated area. Also, there's a limit on how many connections you can have for polling, which means you've got to be mindful of how many connections are active at one time. This setup helps keep things running smoothly without overloading the system. 


### **Push Vs. Pull**

Event Grid uses a Push mechanism to proactively send events to Subscribers, while Service Bus employs a Pull mechanism where subscribers retrieve messages. The risk of overwhelming Subscribers with Event Grid's push approach can lead to throttling or unresponsiveness. To address this, a test was conducted by a team, with a Logic App as a Subscriber, revealing failures in processing due to the rapid delivery of 200 messages in 50 seconds. Introducing a Service Bus between Event Grid and the Logic App, allowing the Logic App to work at its own pace, proved essential for resolving the issue. 

<center><img src="/img/sp_1_2024_04_29.png" height="91 px" width="711 px"  /></center>

In contrast, Service Bus's Pull mechanism allows Subscribers to fetch messages at their desired rate, preventing exceptions even with a high volume of events. The revised architecture included a Service Bus between Event Grid and its Subscriber, with the Logic App broken into individual functions for better control. Testing with JMeter demonstrated successful processing of 200 messages in 7-8 minutes and scaling up to 1000 messages in 13-14 minutes, highlighting the enhanced resilience and fault tolerance achieved by integrating Service Bus. 

### **Loss of messages**

Service Bus requires explicit deletion of messages from the subscription queue under peek and lock mode, ensuring that Subscribers control when messages are removed. In contrast, Event Grid immediately deletes messages from the Event Grid Topic upon delivery to the Subscriber. In above experiments, the team observed that in Event Grid, if exceptions occurred during event processing and were not appropriately handled by the Subscriber, such as forwarding the message to a dead letter queue, the messages could be lost. 

Conversely, in the case of Service Bus, when exceptions occur during message processing, the message is automatically moved to the Dead Letter queue, allowing for automatic retries. Unlike Event Grid, Service Bus Subscribers do not need to explicitly send messages to the dead letter queue; the system automatically routes messages to the Dead-Letter queue in the event of exceptions. 

### **Order of delivery**
Event Grid does not provide a guarantee regarding the order of event delivery, while in the case of Service Bus, the utilization of Message sessions allows us to obtain ordered messages. 

### **Duplicate detection**
Event Grid lacks support for transaction and duplicate detection, while it is a feature that is available in Service Bus. 
### **Viewer**
While the application is in production or development, it is crucial to monitor the messages published in the Azure Messaging Service. Microsoft has not introduced any default product for viewing Event Grid messages. However, external applications like Event Grid Viewer can be integrated as subscribers to the events. It's important to note that Event Grid Viewer doesn't store events, so if retrospective event analysis is needed, another subscriber must be added to store the data in a datastore. Additionally, a mechanism for filtering and viewing stored events should be implemented. It's worth mentioning that this subscriber may face throttling if messages are posted to it at a higher rate. 

In contrast, Microsoft has released a tool named Service Bus Explorer, specifically designed for inspecting published messages. For details, please refer to the version of Service Bus Explorer available in the Azure Portal. 

### **Message retention and lost policy**

Both Event Grid and Service Bus really step up to ensure messages get to their subscribers, but they handle things a bit differently when they can't deliver. With Event Grid, if it hits the retry limits, it'll drop the event. You've got anywhere from 1 to 30 attempts to try again (30 is the default). There’s also a time limit on how long Event Grid will try before giving up, which can be between 1 and 1440 minutes, with 1440 minutes being the standard. 

If you've set up a Dead-letter queue and Event Grid can't deliver the message, it'll send the message there; otherwise, the message is gone for good. Also, if that dead letter container isn’t accessible for about 4 hours, then you can kiss that message goodbye. 

On the other hand, Azure Service Bus pushes messages straight to subscriber queues. When setting up a subscriber, you can decide how long messages should stick around in the queue before they're removed. There’s flexibility here, allowing messages to remain in the subscription queue for quite a long stretch if needed. 

### **Dead letter queue**

Both Service Bus and Event Grid have a safety net feature called Dead-letter queues for messages that can't be delivered, but there's a slight difference in how you set them up. With Service Bus, the Dead-letter queue is ready to go right out of the box. However, for Event Grid, you need to set it up yourself using a Storage account. So, if you're using Event Grid, just remember to do that extra step to ensure your undeliverable messages have somewhere to go. 

### **Integration with azure resources**

Many azure resources have default integration with Event Grid. 

<center><img src="/img/sp_2_2024_04_29.png" height="734 px" width="1306 px"  /></center>

### **When to use what**

In the context of Microservice architecture, where microservices exchange valuable messages, opting for Service Bus over Event Grid is advisable for the following reasons: 

 1. Service Bus permits subscribers to consume messages at their own pace, unlike Event Grid, which pushes events to subscribers, leading to potential exceptions when the event push rate exceeds the Subscriber's processing speed. This feature of Service Bus reduces errors in the system, enhancing resilience and ease of maintenance. 
 2. Service Bus enables messages to be read in Peek and Lock mode, safeguarding them from being lost in case of exceptions. Conversely, with Event Grid, there is a risk of events being lost. 
 3. Service Bus allows messages to be read in an organized manner, while Event Grid delivers messages in an arbitrary order. 
 4. Service Bus supports Transaction and Duplication detection, a feature not available in Event Grid. 
 5. Service Bus offers superior tools like Service Bus Explorer for monitoring and maintenance, whereas Event Grid lacks comparable out-of-the-box tools. This makes it more convenient to observe, manage, and troubleshoot potential issues with Service Bus in the future. 

### **Conclusion with formal reviews outcomes**

- Event Grid is easy to use and administer. 
- Service Bus is easier to deal with business in overall. 
- Reviewers think Event Grid meets the needs of business better than Service Bus. 

### Reference

- **https://www.linkedin.com/pulse/azure-event-grid-vs-service-bus-eklavya-gupta**
