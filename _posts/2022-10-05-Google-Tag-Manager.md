---

title: Google Tag Manager

author: Tharindu Subashith

linkedin: https://www.linkedin.com/in/tdiluksha/

description : Web applications consist of tags to collect user behaviour data, remarketing data, eCommerce data, etc. Google Tag Manager helps to manage all those tags easily without affecting the performance of the web applications.


---
___

#### **What is a Tag?**


Tag is a javaScript code snippet that is embedded in websites to collect information like behavior data, remarketing data, eCommerce data, etc. It is easier to use “Tags” to send data to services like Google Analytics.


#### **What is Google Tag Manager?**

Websites usually contain many tags for different data collection services. That makes the source code of the website cluttered with so many code snippets and it will be difficult to manage all the tags. Also, having all the tags in the source code will lead to performance bottlenecks. The answer to all the above problems is Google Tag Manager.


With the Google Tag Manager, developers will no longer need to add different tags to the source code. A non-developer person can just create and deploy Tags using Google Tag Manager(GTM). Also, tag versioning can be done without any involvement of developers or any changes to the source code. GTM supports creating tags for Google Analytics, AdWords, and many third party tags. Therefore, Google Tag Manager simplifies and speeds up the process of tag deployment.

The following sections will describe how you can set up a Google Tag Manager instance to create tags for the Google Analytics service.


#### **Setup Google Tag Manager**

##### **Setup Google Analytics**


Since we are going to use Google Tag Manager for Google Analytics, let's create the Google Analytics account and take the Measurement Id. You can click the Settings option in the bottom left corner and create the account and property. Then go inside the Data Streams option and create a web data stream. You can find the measurement Id inside here.


<img src="/img/ts_1_2022_10_07.png" height="812" width="1770" />


<img src="/img/ts_2_2022_10_07.png" height="512" width="1627" />


##### **Setup Google Tag Manager**


Then let’s go to the Google Tag Manager and create a new account and container. (If you already have an account and container you can use those also). Since we are going to use GTM with a web application select the target platform as Web.


<img src="/img/ts_3_2022_10_07.png" height="927" width="1435" />


After creating the container you can see the tag id at the top right of the screen.


##### **Create a Tag in GTM for GA4**


Let's first create a simple tag that gets triggered once the web application page gets loaded. Go to the Tag menu inside the container and click on new to create a new Tag. You will see a set of Tags available and select the Google Analytics G4 Configuration tag. Then add the Measurement Id you took from Google Analytics.


<img src="/img/ts_4_2022_10_07.png" height="908" width="1817" />


<img src="/img/ts_5_2022_10_07.png" height="786" width="1417" />


Then select the trigger that triggers the Tag event. Let's select the Page view trigger as the first trigger in the Triggering section.


<img src="/img/ts_6_2022_10_07.png" height="903" width="1597" />


Once you save you are ready with the GTM configuration.


#### **Setup a simple Web application with GTM**

To set up the web application with GTM, you need two code snippets from the GTM container. Let’s go inside the GTM console and locate the Tag Id around the top right of the page and click on that. That will open up a popup with code snippets with some instructions.


<img src="/img/ts_7_2022_10_07.png" height="743" width="1880" />


<img src="/img/ts_8_2022_10_07.png" height="606" width="845" />


You only have to copy and paste these two codes inside <head> and <body> areas of your application HTML file.


<img src="/img/ts_9_2022_10_07.png" height="942" width="1120" />


That is what you have to do to set up GTM with your application. Let’s see how we can debug and see the tag information triggered in the application.


##### **Run and check tag information**


You can go to the GTM console again and click the “Preview” button. Make sure your web application is up and running before doing that. This will open a new browser tab (Tag Assistance) with a popup and in the popup provide the application URL and click the “Connect” button. This will launch your application in a new browser window. Once you interact with your application you will see the tag events in the Tag Assistance window.


<img src="/img/ts_10_2022_10_07.png" height="821" width="1882" />


Also, since you have configured the tag for Google Analytics, you can see the events in the Google Analytics debug view.


<img src="/img/ts_11_2022_10_07.png" height="895" width="1826" />


##### **Create Tags for custom events**


Previously we created a tag that triggers with page view, but if you want the tag to get triggered on the different events, you can do it without doing any changes to your application source code. What you have to do is create a new tag in GTM with different triggering. The following is a tag that gets triggered on the user clicks on the web page.


<img src="/img/ts_12_2022_10_07.png" height="821" width="1617" />


You can even see what element the user has clicked under the “Data Layer” menu in Tag Assistance events.


<img src="/img/ts_13_2022_10_07.png" height="880" width="1880" />

#### **Advantages of using Google Tag Manager**


-	If you have different services subscribing for user interaction information, you don't need to configure every application in your source code.
-	Avoid possible performance bottlenecks of configuring many tags in source code.
-	You can change, update, and remove your tags without doing any changes to the source code without consuming developer time.


