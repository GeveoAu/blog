---

title: API Automation with Rest Assured 

author: Kawshi Bandara

linkedin: https://www.linkedin.com/in/kawshi-bandara-7b3858200/

description : With Rest Assured we can test REST APIs using JAVA libraries. This also integrates well with Maven. There are so many number of tools that can be used in API testing. But Rest Assured is the most popular JAVA library that is used to write and monitor tests for the RESTful Web Services.

---

**API Automation with Rest Assured**

Testing is a crucial stage of any software development life cycle. Now that APIs have become a core aspect of a software it is necessary to do thorough API tests in all the systems. APIs impact is witnessed in all over the software and testing APIs ensure smooth functioning of business level logics. 

In API testing it is required to test various perspectives with large number of test cases. As the software evolves, the number of APIs also start to grow and the number of test cases related to the APIs will increase. This is where automation jumps into assist testing multiple APIs in a cycle. Testing APIs become extremely important even before the UI is built or is under development, testing them repeatedly with different data combinations makes it a very suitable case for automation. 

### **What is Rest Assured?**

With Rest Assured we can test REST APIs using JAVA libraries. This also integrates well with Maven. There are so many number of tools that can be used in API testing. But Rest Assured is the most popular JAVA library that is used to write and monitor tests for the RESTful Web Services.  

### **Why Rest Assured?**

1. Rest Assured is an open source JAVA library.
1. It provides a Domain-Specific Language (DSL) to create an automation script and uses any native language such as Java and tests the RESTful Web API.
1. Rest Assured acts as a headless client and supports XML and JSON formats in request and responses.
1. It can fetch status code, responses, request body and headers from the server for the sent request.
1. Rest Assured enables the BDD style of writing test scripts i.e. in the format of GIVEN-WHEN-THEN so that any business team member, especially from the non-IT background can also view it and understand the logic and test coverage.
1. Just as creating frameworks for UI automation Rest Assured can be used to create automation framework for APIs which can be a huge advantage when running regression tests on the APIs.

### **How to create a Maven project and start testing using Rest Assured**

First of all, we need to download the Eclipse IDE and install the IDE. Set path, JAVA_HOME environmental variable correctly. 

Once Eclipse is installed follow the below steps start API automation. In this steps I have mentioned how to run the Rest Assured project using TestNG.

1. Open Eclipse IDE.
    - The latest Eclipse versions have Maven inbuilt. But to create Maven projects in older versions should install Maven plugin inside eclipse. 
    - For that go to Help->Eclipse Marketplace and search for Maven and install.

1. Create a Maven project
    - Go to File -> New -> Other

<img src="/img/kb_1_2021_07_30.png"/>

- Select Maven Project and click on Next.

<img src="/img/kb_2_2021_07_30.png"/>

- Select the Create a simple project check box and click next.

<img src="/img/kb_3_2021_07_30.png"/>

- Give Group Id and Artifact Id and click on Finish.

<img src="/img/kb_4_2021_07_30.png"/>

3. Add Maven Dependencies

- Go to the pom.xml file and add the necessary dependencies. 
- For rest assured test frameworks two it’s mandatory to have the following rest assured and testng dependencies.

```java
        <dependency>
            <groupId>io.rest-assured</groupId>
            <artifactId>rest-assured</artifactId>
            <version>4.3.0</version>
            <scope>test</scope>
        </dependency>

        <dependency>
            <groupId>org.testng</groupId>
            <artifactId>testng</artifactId>
            <version>7.1.0</version>
            <scope>test</scope>
        </dependency>
```

4.	Install TestNG to run the tests.

- Go to Help -> Install new software and give the TestNG link. To get the TestNG link go to https://github.com/cbeust/testng-eclipse/ page and get the latest release url under the Update sites.

<img src="/img/kb_5_2021_07_30.png"/>

- Copy and paste the url in Workwith field and select TestNG iteams and install.

<img src="/img/kb_6_2021_07_30.png"/>

5.	To add test scripts should create a java class and add the tests.

- Below is a sample method to call a GET API and assert whether the API call returns 200 success code. This is a simplest way to write a test method in Rest Assured.

<img src="/img/kb_7_2021_07_30.png"/>

- Following is the result of the above mentioned code.

<img src="/img/kb_8_2021_07_30.png"/>

<img src="/img/kb_9_2021_07_30.png"/>

### **How to write scripts for testing API calls using HashMap**

HashMap can be used when creating a JSON payload to create a resource with Rest Assured. Rest Assured supports HashMap to send it as payload to Rest API POST, PUT and PATCH requests.

Below is a sample code to use HashMap when writing a test method to do a POST call in RestAssured. In the following code I have called an API where values for Contact Id, Organization Id, Name, Email, Phone number, and Contact type are passed in the request body to create a contact.

<img src="/img/kb_10_2021_07_30.png"/>

### **Summary**

Since API itself is an essential part of software, API testing is a crucial step in the testing life cycle. Because of this reason number methods and tools are present to do API automation and API testing. REST Assured is the most popular open source, Java based library to test REST web services. REST assured does not have a GUI and supports XML & JSON and it has many inbuilt options.

In this blog I have discussed how to automate API requests using REST assured while executing test scripts using TestNG. Hope this will help you to explore on how to automate API test cases using Rest Assured.


