---

title: iUpgradable

author: Sandun Perera

linkedin: https://www.linkedin.com/in/sandunangelo/

description : Competitive software development have various challenges on keeping up with new business needs and technological demands. As software developers we are following various practices to achieve those demands. One topic is easiness on migrating to latest technologies and make the software compatible on new environments. Let's see how to make our software easy for upgradings.

---

**iUpgradable**

How easy is your software to be upgraded to new versions of the same technology stack? If the answer is “Hard” then it would be much harder for an entirely different technology stack also.

Upgradability impacts in 3 main levels;
-	Architectural level
-	Developer level
-	Upgrading phase

Let’s identify the areas of a software that get impacted when upgrading.
-	Component
-	Service
-	Platform services
-	Code behind
-	Libraries
-	User Interface
    
**Component**

In here the component is referred to the smallest unit of code portion that we can think of. Refactoring to into separate functions, files and assembly would increase its robustness and confident in reusing as well.

**Services**

Components with extended capabilities can be refactored to work as services, so other systems can also refer for the features. Services can incorporate with modern dependency injection patterns as well.

**Platform services**

Cloud services, infrastructure services and external vendor services can be encapsulated into custom classes so that application doesn’t have to worry about their details.

**Code behind**

Logic encapsulation, separation of concerns and docker kind of architectural approaches will improve the code migration capabilities, location wise and technology wise.

**Libraries**

Including third-party and vendor provided libraries must be used as they have implemented and shall not modify according to your requirement. If something is missing in library, it is missing, have your own or another library.

**User interface**

Front end applications  consist of lots of repeating components and widgets. More than half of them usually reused in many places in the application. Create a single control with all the capabilities you want and refer that custom control in your application. You have the power to expose only what your application needs and you can have default settings for any additional inputs for the native control. In an upgrade, only that custom control needs changes.

**Summarized idea**

Wrap your repeating or external libraries with custom wrappers and reuse them in the application. In an upgrade only those wrapped custom codes need changes. Do not edit third party referring libraries, you may override them in your codes.

