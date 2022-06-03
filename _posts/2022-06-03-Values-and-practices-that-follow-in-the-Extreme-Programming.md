---

title: Values and practices that follow in the Extreme Programming

author: Dileepa Karunathilake

linkedin: https://www.linkedin.com/in/dileepa-karunathilake/ 

description : Extreme Programming is an agile software development framework that produces higher quality software in a short time while keeping the welfare of the development team. To achieve productivity extreme programming follows certain values and practices that can be also used in any other development process.

---
___

Extreme Programming (XP) is an **agile software development framework** that produces higher quality software in a short time while keeping the welfare of the development team.


XP team consists of customers, managers, and developers, and all of them are equal inside the team. To achieve high productivity these teams, keep a simple, self-organized, and effective environment around. This environment courage developers to adapt to changing requirements easily.


In the XP team, their highest priority is to keep customer satisfaction. Instead of delivering the products that need in the future, the XP delivers the products when customers need them. 


The success of XP depends on the set of **values**, and **practices** it follows.


#### **Values that Extreme Programming follows**


1. **Communication** – In XP, continuous communication happens between team members and the customers. Face-to-face daily communication help to create the best solutions and give the best adaptability for the changing requirements.

2. **Feedback** - XP always continues with the customer and developer's feedback. In every iteration, developers deliver the product as soon as possible then by adapting to the customer's feedback they can deliver a high-quality product at the end of each iteration.
3. **Simplicity** - Always XP keeps the designs as simple as possible. The development process is simple and manageable, so even newcomers can adapt easily. In XP, solve problems in the simplest way by doing the things that are only required to implement the features. Extra things can be always caused for the complexity of the system and development process.
4. **Courage** – XP always push the developers to adapt to changing requirements and to give their opinion to develop the project to a far better version. Developers do not need to be afraid of taking responsibility because everyone works as a team, not as an individual.
5. **Respect** - In the XP environment, everyone keeps respect among each other members for their unique contributions since the success of the product and the team depends on everyone. This respect enables sharing of great ideas within the team. 

These values help the XP to give higher quality output while keeping the welfare of the developers. 


##### **Practices that extreme programming follows to achieve and maximize the above values**


To achieve and maximize the above values Extreme programming follows certain practices. These practices are not strict and can change according to the process while the implementation going on. Here we discuss these practices under the main 5 sections. 

1.	Planning 
2.	Managing
3.	Designing
4.	Coding
5.	Testing

##### **Planning** 
**Creating User Stories**


User stories are written by the customers (product owners) by looking at the system from the user's perspective and avoiding the technical details. User stories help to do the time estimation in the release planning meeting. One user story can get 1 to 3 weeks to implement. To verify that user stories are implemented correctly, acceptance tests are created.


**Release Planning Meeting**


Creates release plans that describe how to layout the overall project according to the user stories. Most important user stories get the highest priority. This planning can be done according to the time (How many user stories can be completed before the given time) or scope (How long it will take to complete the selected user stories). This release planning is done depending on four variables, 
- Scope (How much)
- Resources (How many)  
- Time (When) 
- Quality (How good)


**Iterations**


Divide the releases into small iterations. The time of these iterations should be constant throughout the project and developers should take all iteration deadlines seriously and deliver a working product after each iteration. Planning of these iterations should be done by iteration planning meeting and the perfect period for an iteration would be 1 to 3 weeks.


User stories should select according to the priority decided in the release planning meeting before. User stories are divided into tasks (tasks cards) and those tasks are written in a way that is understandable to the developers. Each task can take 1 to 3 days to complete.

**Small Releases**


The team needs to do small releases (small production-ready products) of the system more often (at least in every two weeks). The most important thing is to do the development as early as possible and then get customer feedback before the production release. So, there would be additional time to fix the issues.


##### **Managing**

**Open Workspaces**


communication is very important in XP. So, working in the open area/ central area is essential to reduce barriers between the team members. Developers should feel connected even though they are working alone. 

**Having Sustainable Pace**


In each iteration, instead of having a lot of incomplete tasks, it's better to have some completed and production-ready tasks. Also, iteration delaines should be taken seriously. Developers should reduce overtime work as much as possible. By working overtime people get tired and it will lead the team to less productivity. If completing a task within the time is difficult, it is better to have a release planning meeting or iteration planning meeting again to change the scope and timing.


**Daily Stand-up Meetings**


Short meetings where members are having communication with all the team members. In this meeting discuss the problems, solutions, and what is the progress from the last meeting to the current meeting. During the stand-up meeting developers report at least three things, 
•	What was accomplished the previous day 
•	What will be done today 
•	What problems were causing delays


**Move people around**


To avoid knowledge loss inside the team cross-training is more important than only working on the same thing for a long time. By assigning different tasks moving people around the code base is good, then everyone knows the whole picture they are working on. To reduce the productivity loss, pair programming can be used.


##### **Designing**
**Simple Design**


Simple design help to complete tasks in less time than using complex design. It's better to always start work with simple tasks and if find something complex then convert them into a set of simple tasks. And maintaining a simple code base help to achieve some qualities, 

- Testable – Writing unit tests and Acceptance tests is easy.
- Understandable - This is subjective according to the person but must.
- Browsable – Should be able to find something in code when you need to find it.
- Explainable – Should be able to explain the functionality to someone easily.
Also, class naming and method naming should be consistent, understandable, and reusable throughout the system.

**Collective Designing** 


Designing is done with the support of the whole team because when there are more people, the team can come up with great ideas. To reduce the complex problems, the team considers all the solutions that have and then selects less risky ones. Also, to reduce the complexity and extra workload, should avoid adding additional functionalities that could be used in the future. 


**Code Refactoring**


Code refactoring increases the quality of the code and saves a lot of time for future developers and the development process. It Increases the simplicity and reduces the complexity. Refactoring is helping your code to be more understandable, readable, and extendable.  


##### **Coding**
**Coding Standards**

Coding must follow the coding standard that is agreed upon. It helps to have a consistent, readable, and understandable code base.


**Unit Test First Approach**


If developers can follow the unit test first approach, they can understand the scenarios well. Then implementing the functionalities will be very easy. It helps to measure your progress and can know when the development is completed. By following this approach, you have a testable and completed system component at the end. 

**Pair Programming**


All the codes that are sent to the production environment should be pair programmed. In pair programming, two people are working together on the same computer while implementing the same functionalities by focusing on the code at the same time. It is very effective and takes time to practice since both should have the ability to give and receive ideas correctly. And pair programming is not mentoring, but two people working equally without considering their experience levels.

**Continuous Integration**


Developers should not wait to commit their changes for more than a day. Everyone is responsible for reducing conflicts. Code should always be integrated when working software available even if it is a small portion rather than a fully completed one. And always good to work in the latest version. 

**Collective Ownership**


All members should have collective ownership of the code base. Any developer should have the ability to change any part of the code at any time. This is more reliable since everyone has an idea about every class and method and should not want to depend on a single person to have responsibility for certain tasks.


##### **Testing**

**Test-Driven Development**

Unit test is an important thing in XP. All code should be unit tested. It should be done by a framework automatically, and it is preferred the unit test-first approach. Unit tests are also added to the code repository with the code. The test should be written with the implementations and only unit tested code should be released into the production environment. 


Since all classes are guarded by unit test writing collective ownership is also possible. After doing any changes anywhere in the code base developers can confirm that all the unit tests are working fine before pushing the changes to the repository. 


Test-driven approach also encourages developers to do refactoring. After the changes have been made developers can easily test if everything is working fine without breaking. It can look more time-consuming and harder to do the unit test writing. But it always saves more time in the future for everyone. 

**Acceptance Tests**


Acceptance tests are created by user stories. A user story can have several acceptance tests and once done the implementation of the user story all the acceptance tests should be covered. The customer can check whether all the acceptance tests are completed and give a score by verifying that. User stories become complete after all acceptance tests are passed.

##### **Conclusion**

With the values and practices above discussed extreme programming becomes highly productive while maintaining good welfare among the team members. It increases the ability to adapt to the changing requirements. These values and practices are not only valid for extreme programming, and they are not strict. So, these values and practices can use in any development process if it seems productive and applicable.


#### **References**

- http://www.extremeprogramming.org/ 