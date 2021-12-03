---

title: 7 Tips to identify defects effectively    

author: Thilanka Weerasinghe

linkedin: https://www.linkedin.com/in/thilankaweerasinghe/

description : Worst nightmare of QA engineers is finding defects in a live environment. Therefore it is necessary that you release bug/defect free application to live environment. Though it is not easy to find all the bugs in an application as QAs we should find all the bugs possible. In this article I wish to explain few tips I used to follow when testing an application.

---
___

Worst nightmare of QA engineers is finding defects in a live environment. Therefore it is necessary that you release bug/defect free application to live environment. Though it is not easy to find all the bugs in an application as QAs we should find all the bugs possible. In this article I wish to explain few tips I used to follow when testing an application.

### What is a defect

According to ISTQB glossary defect definition as follows. 

“A flaw in a component or system that can cause the component or system to fail to perform its required function, e.g. an incorrect statement or data definition. A defect, if encountered during execution, may cause a failure of the component or system.”

In simple terms, defect is an error or bug which happens when application deviation from expected behavior. Bugs can arise because of so many reasons. Mainly, it will be because of miscommunication, program errors, continues change of the requirement and time pressure. To avoid repeating same bug it is important to understand the root cause of the bugs and what type of bug it is. 

### Common Types of Defects

Defects can be categorized based on different measures. It can be categorized based on nature, severity, priority or based on the way it found.  

Here are the defect types based on defect’s nature.

-	Functional defects 

If the application functionality deviates from expected behavior it can be categorized as functional defects. These defects mostly arise with communication gap and frequent change of the requirement. 

- Performance defects 

Application performance matrix related defects are categorized as performance defects. Performance matrix like speed, response time, stability, memory consumption and network consumption related issues can be identified by conducting a performance test.

- Usability defects

User experience makes inconvenience when using the application identified as usability defects. Conducting usability testing QA engineers can identify usability defects. 

- Compatibility defects 

Application incompatibility with different software, hardware, devices, or network can be identify as compatibility defects.  Compatibility defects can be identified by conducting compatibility testing. 

- Security defects

Weakness in system to have security attacks are identified as security defects. Penetration testing should conduct to identify the security defects in an application. 

Following are the development-based defects. 
-	Arithmetic Defects
-	Logical Defects
-	Syntax Defects
-	Multithreading Defects
-	Interface Defects
-	Performance Defects

### 7 Golden Tips

To avoid all those defects slipped when testing, I used to follow 7 golden tips. 

- Make a list of slipped bugs

It is natural to slip one or two bugs while testing. But if you allow to slip the same bug again and again then that’s something to worry about. This tip has become my life savior to avoid that. Make a list of bugs which tend to slip from your hand, so you can refer that when you are doing testing or when it’s time to do production release. 

-	Developer is a good friend 

Though QA engineer feels like Developer is the worst enemy you have, trust me its otherwise. Have a good communication between developer and QA engineer will always help to minimize introducing bugs to the application. Also, the developer will also understand the QA best practices and they will also adhere to them to have a quality product. Having this good relationship between developer and QA will help prevention of defect introduction rather than finding defects. 

-	Improve test coverage 

It is always needed to have a good test coverage to detect bugs in an application. When designing test cases make sure to cover acceptance criteria, impediment test scenarios and improve the test coverage. Review the test case with peers and get third party suggestion which will be helpful to improve the test case coverage.

- Trust your gut

When you are doing testing always trust your gut. May be the feature can be very simple but if you feel like something is wrong, it can be true.  It may come with your experience or the way you think about it. But always trust your gut. 

- Use good data to test

Selecting good test data is very important. There are different techniques to find good data. Equivalent partition, boundary value analysis and most importantly think from the use’s point to select good data set. 

-	Live with the domain

If you know the domain and application properly it will be very easy for you to identify the potential defects in the system. Do not lose your grip from the domain. Keep it updated. It will help you to identify defects in an application. 

-	Check the environment

It is essential to test the application in different environment. But most of all you need to choose the correct environment and correct settings to do the testing. There can be defects based on the environment you test and settings you used. So, it is important to test in correct environment and setting conducting testing. 

**Hope these 7 tips will help you to improve your testing and deliver quality product. Happy testing!**

### References

https://glossary.istqb.org/en/search/

https://www.tutorialspoint.com/software_testing_dictionary/defect.htm 
