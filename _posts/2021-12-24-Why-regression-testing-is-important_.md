---

title: Why regression testing is important?

author: Nishadi Lakshika 

linkedin: https://www.linkedin.com/in/nishadiblock

description : In a software project, QA team needs to perform regression test in many situations. Its very important to identify when to perform regression test and how we do it. I hope this blog post will helps you to understand bit more about regression testing.

---
___

Regression testing is carried out to make sure that changes done to the application or related software components do not break existing functionality in the system. Newly added features, bug fixes, patches, integrations may have been created bugs in software unintentionally. In that case, regression testing helps to detect bugs caused due to new changes and it ensures better performing software. It becomes mandatory to carry out a regression test to detect troublesome side effects that might have been caused due to a new operating environment. Highly beneficial to software projects that align with agile practice as that introduces continuous changes to the product to meet end user needs. The ultimate goal of a software project is to deliver a high quality product to the end users so that regression testing plays a major role to identify threats that are linked with software upgrades and mitigate the risk of presenting faulty software to the end user. 

Regression test is not just a retesting and it covers the entire system and has a much wider scope of activity than retesting. Regression testing can be performed using the following techniques.

<img src="/img/nl_1_2021_12_24.jpg" height="600" width="1203" />

*	Retest All

This requires huge time and resources because it need to execute all the tests in the existing test bucket

*	Regression Test selection

Instead of expending time on executing the entire test suite better to select a part of the test suite to be run

*	Prioritization of Test Cases

Prioritize the test cases depending on business impact, critical and frequently used functionalities

Though regression testing can be carried out at any level of testing such as unit testing, integration testing, system testing or acceptance testing it is suitable to do it during system testing. The way that regression testing can be done depends on factors such as change type, bug fixed, etc. Few common types of regression testing types are as follows:

*	Corrective Regression Testing

When there are no changes introduced in existing software/product specification already existing test cases can easily be reused to conduct the regression test 

*	Retest-all Regression Testing

This is very time consuming because we reuse all test cases and involve all aspects of particular application even the areas which have not been changed. This is not recommended to perform when there is a small change

*	Complete Regression

Complete regression testing is highly valuable to identify unexpected bugs when multiple new changes have certain impact on software’s root code. Basically when multiple changes have been made in existing code its good to perform complete regression

*	Progressive Regression Testing

When there are certain changes done into software specification and new test cases are designed progressive regression testing works effectively 

*	Selective Regression Testing

When conducting selective regression testing a subset of existing test cases is used to reduce the effort required for retesting. This is done to analyze the impact of new code to the existing code

To avoid future delays and reworks its a good practice to keep regression tests updated based on new specification changes and new updates of the software. As the full regression test takes time it's good to do an impact analysis of changes first and identify the areas where having the highest probability of impact. Rather, doing regression tests manually  Software development team can go for regression test automation option to reduce time and resource cost as it is repeated frequently.
