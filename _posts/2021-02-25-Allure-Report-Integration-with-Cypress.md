---

title: Allure Report Integration with Cypress

author: Shamini Mendis

linkedin: https://www.linkedin.com/in/shamini-mendis-515484148/

description : There are lots of cool testing frameworks for different programming languages. Unfortunately, only a few of them can provide good representation of test execution output. An open-source framework designed to create test execution reports that are clear to everyone in the team.

---

**Allure Report Integration with Cypress**

There are lots of cool testing frameworks for different programming languages. Unfortunately, only a few of them can provide good representation of test execution output. Allure Report Framework is an open-source framework designed to create test execution reports that are clear to everyone in the team.

### **What is Allure Report?**

Allure Framework is a flexible lightweight multi-language test report tool that not only shows a very concise representation of what have been tested in a neat web report form.

Allure reports allows everyone participating in the development process to extract maximum of useful information from everyday execution of tests.

### **Why Allure Reports?**

There are lots of cool testing frameworks for different programming languages. Unfortunately, only a few of them can provide good representation of test execution output.

An open-source framework designed to create test execution reports that are clear to everyone in the team.

From the dev/qa perspective Allure reports shorten common defect lifecycle: test failures can be divided on bugs and broken tests, also logs, steps, fixtures, attachments, timings, history and integrations with TMS and bug-tracking systems can be configured, so the responsible developers and testers will have all information at hand.

### **Features of Allure Reports**

-	Users can group tests by stories or features or assertions
-	User can mark Flaky Tests easily and it will display on the report
-	Helps to categorize Product Defects and Test Defects
-	Interactive User Interface
-	Support for languages like Java, Python, Javascript, PHP, .NET and etc

### **Why Allure Reporting to Cypress?**

-	Cypress does not have an inbult reporting solution
-	Allure reports provide great presentational diagrams
-	Easy to install
-	Clear and nice reporting UI
-	Can easily investigate test runs

---

### **Allure Report Installation with Cypress Method 1**

Installing Allure Reporter is very straightforward with Cypress. After creating the project run the following npm command

```bash
npm i -D @shelex/cypress-allure-plugin
```

Add Allure plugin to cypress plugins. To do that add the following code snippet of allurewriter inside the plugins/index.js file.

```js
const allureWriter = require('@shelex/cypress-allure-plugin/writer');

module.exports = (on, config) => {
    allureWriter(on, config);
    return config;
};
```

Then register the command of allure plugin with cypress/support/index.js file

```js
import '@shelex/cypress-allure-plugin';
```

To enable intelliSense in your IDE use following reference and add in to plugins/index.js

```js
/// <reference types="@shelex/cypress-allure-plugin" />
```

---

### **Allure Report Installation with Cypress Method 2 -**

Installing Allure Reporter is very straightforward with Cypress. After creating the project run the following npm command

```bash
npm install --save-dev mocha-allure-reporter allure-commandline
```

---

### **Configuring Allure Reports using Method 1 -**

The easiest way to configure Allure Reports for your series of tests using command line method. Simply passing Allure Environment variables as follows.

```bash
npm cypress run --env allure=true,allureResultsPath=someFolder/results
```

Once setting up the project, run the following command to obtain test results as Allure Report

```bash
npx cypress run --env allure=true
```

---

### **Configuring Allure Reports using Method 2 -**

First create a custom command to run the test script in Package.json file

```bash
"cy:clientLogin": "cypress run --spec \"UITests/Tests/testscriptname.js\" --reporter mocha-allure-reporter",
```

Add another custom command to create results from the test run

```bash
"report:allure": "allure generate allure-results --clean -o allure-report && allure open  allure-report",
```

Create a custom command to run the scripts and generate the reports 

```bash
"test:allure": "npm run cy:clientLogin && npm run report:allure"
```

---

### **Sample Allure Report Features**

<img src="/img/sm_1_2021_02_25.png"/>

<img src="/img/sm_2_2021_02_25.png"/>


### **Allure Report Structure**

Whenever you have the thought what the report looks like. You will most likely need to get more information rich reports. You may need to consider utilizing one of the Allure connectors for your testing structure, which will permit to gather substantially more data. Leap to the mixes area to study combination with testing systems.

- Ordinary report comprises of ‘Outline’ tab, route bar, a few tabs for various types of test information portrayal and experiment pages for every individual test.
- Each Allure report is supported by a tree-like information structure, that addresses a test execution measure. Various tabs permit to switch between the perspectives on the first information structure subsequently giving an alternate point of view.
- Note that all tree-like portrayals including Behaviors, Categories, xUnit and Packages uphold sifting and are sortable.

### **Overview Page**

Overview page hosts several default widgets representing basic characteristics of your project and test environment.

<img src="/img/sm_3_2021_02_25.png"/>

- Statistics - overall report statistics.
- Launches - if this report represents several test launches, statistics per launch will be shown here.
- Behaviors - information on results aggregated according to stories and features.
- Executors - information on test executors that were used to run the tests.
- History Trend - if tests accumulated some historical data, it’s trend will be calculated and shown on the graph.
- Environment - information on test environment

### **Categories Page**

Categories tab gives you the way to create custom defects classification to apply for test results.

<img src="/img/sm_4_2021_02_25.png"/>

### **Suites Page**

On the Suites tab a standard structural representation of executed tests, grouped by suites and classes can be found.

<img src="/img/sm_5_2021_02_25.png"/>

### **Graphs Page**

Graphs allow you to see different statistics collected from the test data: statuses breakdown or severity and duration diagrams.

<img src="/img/sm_6_2021_02_25.png"/>

### **References**

https://demo.qameta.io/allure/ (Sample Allure Report)
