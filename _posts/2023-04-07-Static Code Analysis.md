---

title: Static Code Analysis.

author: Buddhika Chathuranga.

linkedin: https://www.linkedin.com/in/buddhikac96/

description: Static code analysis is analyzing software code without actually executing it, typically using automated tools. It is a technique used in software development to identify potential vulnerabilities, bugs, or other issues that could affect the software's performance, security, or maintainability.

---
___

#### **What is SCA**

Static code analysis is analyzing software code without actually executing it, typically using automated tools. It is a technique used in software development to identify potential vulnerabilities, bugs, or other issues that could affect the software's performance, security, or maintainability.

Static code analysis tools analyze the source code of a software application to identify issues such as coding errors, security vulnerabilities, and other potential problems. These tools can analyze a wide range of programming languages and can identify issues such as unused variables, null pointers, buffer overflows, code duplication, and coding standards violations.

The benefits of static code analysis include improved software quality, increased efficiency of the development process, reduced costs, and improved security. Static code analysis can help developers catch issues early in the development process, which can reduce the time and cost of fixing problems later on. It can also help ensure compliance with coding standards, which can improve the maintainability and readability of the code.


#### **Important of SCA in a software project**
- **Early detection of defects:** Static code analysis can help detect defects in the code early in the development cycle, which is more cost-effective than finding and fixing the issues later in the development process.
- **Improved code quality:** Static code analysis tools can help developers identify and fix coding errors, security vulnerabilities, and other potential problems, leading to higher code quality.
- **Consistency and adherence to coding standards:** Static code analysis tools can enforce coding standards and best practices, ensuring consistency and maintainability of the codebase.
- **Increased developer productivity:** By automating code analysis, developers can save time and focus on writing new features and improving the software's functionality.
- **Better software security:** Static code analysis can identify potential security vulnerabilities in the code, allowing developers to address them before they become exploited.

#### **Vulnerabilities that can find using SCA**
Static code analysis (SCA) can help identify a wide range of code vulnerabilities and issues, including:
- **Buffer overflows:**  These occur when a program tries to store more data in a buffer than it can handle, potentially leading to memory corruption and security vulnerabilities.
- **Null pointer dereference:** These occur when a program tries to access a null pointer, which can cause a crash or other unexpected behavior.
- **Code injection:** These vulnerabilities occur when untrusted data is included in a code string, leading to the execution of unintended code.
- **Cross-site scripting (XSS):**  These vulnerabilities occur when user input is not properly sanitized and can be executed as code on a website.
- **SQL injection:**  These vulnerabilities occur when untrusted data is included in a SQL query, leading to unintended access to or modification of a database.
- **Improper input validation:**  This can allow attackers to bypass security measures and perform unauthorized actions within a system.
- **Race conditions:**  These occur when multiple threads or processes access the same resource at the same time, leading to unpredictable behavior and potential security vulnerabilities.
- **Memory leaks:**  These occur when a program fails to release memory properly, potentially leading to performance issues and security vulnerabilities.

SCA tools can also identify coding errors, coding standards violations, and other potential issues that can impact the quality and security of software applications. By using SCA in the development process, developers can identify and address these vulnerabilities before they become exploited, improving the overall security and reliability of the software.

#### **SCA Tools**
Several tools are available for static code analysis, both open-source and commercial. Here are some examples:
- **SonarQube:** This is an open-source platform for continuous code quality inspection that supports a wide range of programming languages, including Java, C#, Python and JavaScript, etc.
- **FindBugs:** This is an open-source static code analysis tool for Java that can identify a range of potential issues, including null pointer dereferences, incorrect synchronization, and code style violations.
- **ESLint:** This open-source static code analysis tool for JavaScript can identify coding errors, potential security vulnerabilities, and coding style violations.
- **Checkmarx:** This commercial tool for static code analysis supports a wide range of programming languages, including Java, .NET, and Python. It can identify potential security vulnerabilities, coding errors, and other potential issues.
- **Veracode**: This is a cloud-based tool for static code analysis that can identify potential security vulnerabilities, coding errors, and other issues in a wide range of programming languages.
- **CodeSonar:** This is a commercial tool for static code analysis that supports a wide range of programming languages, including C, C++, Java, and Python. It can identify various potential issues, including null pointer dereferences, memory leaks, and race conditions.

These are just a few examples of the many static code analysis tools available. The choice of tool will depend on the programming language used, the type of project, and the specific requirements of the development team.

#### **Using SonarQube for SCA**
- In this example to perform SCA I integrated SonarCube into Azure DevOps.
- In the Azure DevOps pipeline, SonarQube getting triggered.

Here is the code. Let’s see how SonarQube catches vulnerabilities in Program.cs file


<img src="/img/bc_3_2023_04_17.png" height="647 px" width="761 px"  />

Here is the summary from SonarQube.


<img src="/img/bc_6_2023_04_17.png" height="617 px" width="1153 px"  />

I have not written any unit tests for the Program class. Hence you can see the code coverage percentage is 0. Also, you can see, SonarQube has found 5 code smells. Let’s look inside the code smells tab.

<img src="/img/bc_5_2023_04_17.png" height="562 px" width="1143 px"  />

These are the code smells, that SonarQube has found. Let’s look at that code smells with more details.


<img src="/img/bc_1_2023_04_17.png" height="700 px" width="1000 px"  />

SonarQube provides information about the code smell. Also, it explains why it is an issue.


<img src="/img/bc_2_2023_04_17.png" height="700 px" width="1000 px"  />

Now, this is a tiny example of using SonarQube for SCA. We can use SonarQube like SCA tools to improve the code quality of our projects. Refer to the following report which I download from the internet.


<img src="/img/bc_4_2023_04_17.png" height="600 px" width="800 px"  />

In this article, you can find how to integrate SonarQube into the Azure DevOps pipeline.

Integrate SonaQube into Azure DevOps.

References
- ChatGPT
- https://docs.sonarqube.org/latest/
- https://www.sonarsource.com/
- https://www.youtube.com/watch?v=4HhHER0n8ls



