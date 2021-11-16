---

title: fastlane and Azure DevOps - Apple App Store CI extension

author: Akila Iroshan

linkedin: https://www.linkedin.com/in/akilairoshan/

description : fastlane is a tool for mobile developers to automate deployments and releases for their iOS and Android apps. It can handle tasks like generating screenshots, dealing with provisioning profiles/code signing, and releasing applications. Additionally, fastlane has support for CI integrations such as CircleCI, Jenkings, Travis CI, Azure DevOps, etc.

---
___  

In this brief article, we will go through the authentication options available in Azure DevOps - Apple App Store CI extension. 

### **fastlane** 

<img src="/img/ai_1_2021_09_01.png"/>


fastlane is a tool for mobile developers to automate deployments and releases for their iOS and Android apps. It can handle tasks like generating screenshots, dealing with provisioning profiles/code signing, and releasing applications. Following fastlane [documentation](https://docs.fastlane.tools/), deployment/release scripts can be automated for mobile projects and save valuable time!

Additionally, fastlane has support for CI integrations such as CircleCI, Jenkings, Travis CI, Azure DevOps, etc.

### **Azure DevOps “Apple App Store” CI extension**

[Apple App Store](https://marketplace.visualstudio.com/items?itemName=ms-vsclient.app-store) is such extension which is using fastlane, available in Azure DevOps to configure iOS deployment/release workflows. With this extension, you will be able to configure tasks, such as TestFlight release, App Store release, App Store Promote, etc in Azure DevOps.

To use Apple App Store extension tasks, you need to create Apple App Store Service Connection in Azure DevOps to connect with Apple App Store Connect. 

From early 2021 Apple made it required to have two-factor(2FA) for Apple IDs. This affected iOS CI automation pipeline since during releases it required manual intervention if you configured the Apple App Store service connection in the usual way. Hence, in this article, we are looking for a recommended way of authenticating with Apple App Store Connect by fastlane.

### **Authenticating with Apple App Store Connect**

There are 4 ways to connect to Apple services in fastlane documentation, but there are two Apple App Store Service Connection.

1. Basic Authentication

<img src="/img/ai_2_2021_09_01.png"/>

Apple ID credential is used in this method. Since 2FA is enabled for AppleIDs, in this method, we have update fastlane Session from time to time when it is expired. ☹ 

1. Token Based Authentication

<img src="/img/ai_3_2021_09_01.png"/>

This is the recommended method by fastlane. Here App Store Connect API key is used for authentication. However, it does not support all the fastlane features yet. Check out [App Store Connect API](https://docs.fastlane.tools/app-store-connect-api) documentation.

To Configure the Apple App Store service connection with this method first you need to generate the App Store Connect API key and use key ID, Issuer ID, and Key Content in Apple App Store service connection wizard.

### **Generate App Store Connect API key**

1.	Log in to App Store Connect from a user with Account Holder permission
2.	Select Users and Access
3.	Select the API Keys tab

<img src="/img/ai_4_2021_09_01.png"/>

4.	Click Request access/Generate API Key
5.	Enter a name for the key. The name is for your reference
6.	Under Access, select the role “App Manager” for the key
7.	Click Generate.


### **Apple App Store Service Connection wizard**

You can grab all three necessary information from the UI.

<img src="/img/ai_5_2021_09_01.png"/>

You can grab all three necessary information here.

1.	Issue ID
2.	Key ID
3.	Click "Download API Key" to download your API key. (Note: The download link appears only if the private key has not yet been downloaded. Apple does not keep a copy of the private key. You can download it only once.)

Enter above information in Apple App Store service connection wizard. Key content needs to be converted to base64 format when adding it to the wizard.
                    
Then you can work on the rest of the iOS CI configuration with this service connection!
