---

title: Saving Postman Collection Test Results to a CSV File using Newman 

author: Kavindra Lunuwilage

linkedin: https://www.linkedin.com/in/kavindra-lunuwilage/

description : What if you need to save the Response or Test Status to a file using Postman? Now it is a problem, and you cannot do that with Postman. Unfortunately, Postman would not allow writing the responses to a file due to a security precaution that Postman has built in.But do not worry. There is a workaround to overcome this problem, and we will now explore it.

---

### **Saving Postman Collection Test Results to a CSV File using Newman**

<img src="/img/kl_01_2021_06_25.png"/>

Using Postman, we can easily send a request and get a response from an API call within few seconds. But what if you need to save the Response or Test Status to a file using Postman? Now it is a problem, and you cannot do that with Postman.

Unfortunately, Postman would not allow writing the responses to a file due to a security precaution that Postman has built in. But do not worry. There is a workaround to overcome this problem, and we will now explore it.

#### **Problem?**

In my current project, I was given a task to create an Execution Summary Document with API test run results. To do that, first, I need to remove the existing record in the field and replace it with a new data record. Thus, there were main two API calls, one is to remove the record, and the other is to add a new record.

Also, I need to get an output file separately, whether the record is removed successfully or added successfully. Here Assume my two API Requests are

1. Remove Existing Member Charity Record
1. Add New Member Charity Record

#### **Prerequisites -**

1. Export the API Requests as a Collection from Postman to a folder.
1. Export the Environment from the Postman to the same folder.
1. Open the above folder from the Code Editor (Prefer VS Code).
1. Installation of Node.js.
1. Create a .js file by any name.
1. Create a Package.json file using **npm init**
1. Install Newman to the machine using **npm install newman**

#### **Back to the Problem**

To give a basic idea, Newman is a command-line collection runner for Postman. For this, I used the Newman Library for our above-created project.

When you are running Newman as a Library, easily we can capture the **Events Emitted during a Collection run.** To know more about this, refer to the [Newman Documentation in GitHub](https://github.com/postmanlabs/newman#newmanrunevents)

<img src="/img/kl_02_2021_06_25.png"/>

From the list of events, I need to capture the event that will trigger before completing the run. It is because to assert whether the API request is successful or failure.

#### **Solution**

**Step 1 -**

First, create a js file and add the following code lines. From this, Newman will run as a Library with your Postman Collection.

<script src="https://gist.github.com/kavioshanaiesecer/c6bb38cd0637d9c53fe3f3f13e6cc7be.js"></script>

As the Collection to run, I passed the **Collection File Name** exported from Postman, and as **iterationData,** I set the Data CSV file where I am having the usernames, passwords, and preferred selections of the users.

Basic error handling is written to log in to the console if there is an error, just in case.

**Step 2 -**

To get the results of the API Response, I captured the **BeforeDone** Event that triggers before the completion of the run.

Just after the **newman.run()** function ends, type **.on()** to continue with the event that emitted. To give a brief idea of how this works, just console.log() and see the results.

<script src="https://gist.github.com/kavioshanaiesecer/f9e3ff14d9bd9f19fdb59b11da323195.js"></script>

To run the collection file and view results, use the following command in the terminal. Then in the terminal, all response results will be listed.

**node CREATED_FILENAME.js**

But this way is a bit hard to read and understand the results. To make this more readable and understandable, we can use **Debugger Mode** in VS Code.

Add a breakpoint to the console.log(data) line and run the Debugger in VS Code. As shown below the image, you can access the data available and properties and their values.

<img src="/img/kl_03_2021_06_25.png"/>

After identifying the relevant object you need to access and get data, right-click on the object and **Copy it as an Expression.** Then paste inside the console.log as below.

**console.log(data.summary.run.executions.toString());**

Now you can get only the necessary data as an output to your terminal.


<script src="https://gist.github.com/kavioshanaiesecer/56d7f53fb772400edcb26d26fdcd0f83.js"></script>


When the Collection is running, to capture the results from the execution and mark each iteration PASSED or FAILED, we can use **.reduce()** function with a call back function.

**Step 3 -**

After capturing the right event with the test results, you now have to store the captured results in a .csv file. To do that following code snippet will help.

Here I created a function name **updateCSVFile()** with test results as its parameters. To read and write files, we need **File System (fs) library** from node.js. To import it at the top of the file, copy and paste the following command.

**const fs = require(‘fs’);**

Inside the **updateCSVFile()** function now we can read the **DATA_CSV_FILE** using readFile(). There two parameters for error and data or the content of the file.

Also, inside **readFile()** Async function, proper error handling can be added to ensure any errors to throw that error.

Now let’s read the data; we need a **CSV Parser.** I choose the **Papa Parse** to parse CSV String. Also, to handle CSV files having headers, add header: true inside the Parser. Then it will avoid taking header values as actual data.

**const jsonData = Papa.parse(data, {header: true});**

To install Papa Parse, use the following npm command.

**npm install papaparse — — save**

After installing import Papa Parse to the file using

**const fs = require(‘papaparse’);**

To update every item in the file based on the response data from Newman, we use **.map()** function.

**jsonData.data.map((item, index) => item.testResults = testResults[index]);**


<script src="https://gist.github.com/kavioshanaiesecer/5f3563c57a0ffc80158d77aa07289c84.js"></script>


Now add the **writeFile()** function from the File System to write the results to the CSV File. Inside writeFile() function same error handling can be done as previous and console.log() statement can be added to make sure the function is completed.

Now it's time to run the script we created and see the results. To run the script use the following command.

**node CREATED_FILENAME.js**

After finishing the test run, an output file (.csv) will be created inside the Test Results folder. Following is a screenshot of what my output CSV file looked like.

<img src="/img/kl_04_2021_06_25.png"/>

#### **Referencens -**

1. [Newman Documentation Github](https://github.com/postmanlabs/newman)
