---

title: BrowserStack – Your Testing Pal for Mobile App Testing

author: Dinithi Weerabahu

linkedin: https://lk.linkedin.com/in/dinithi-weerabahu

description : Are you tired of playing with Android Emulators for Mobile Testing? Do you often find that your emulators are stuck or it takes ages to load a single page? Yes.. we all have been there. Well.. you don’t have to do that anymore! Here comes the era of BrowserStack. A promising tool that could be your testing buddy for Mobile App Testing. 

---

**BrowserStack – Your Testing Pal for Mobile App Testing**

Are you tired of playing with Android Emulators for Mobile Testing? Do you often find that your emulators are stuck or it takes ages to load a single page? Yes.. we all have been there. Well.. you don’t have to do that anymore! Here comes the era of BrowserStack. A promising tool that could be your testing buddy for Mobile App Testing.

Today I will walk you guys through how effectively we can utilize Browser Stack for Mobile App testing. Long before BrowserStack days, we, the QA team from Doing Good Rewards (DGR) used Emulators and Geveo owned test devices for both Android and iOS Testing. One pressing requirement for using a tool is, mobile app testing should focus more on the latest OS versions across multiple different devices.

As QAs, we need to determine the number of devices that app must be tested on and then need to download emulators and carry out testing tasks. We all know how tiresome it is to play around with Android emulators and iOS simulators. Not only those software programs are inefficient, but also they are slow compared to the real devices as they involve in binary translation. Now that we have adhered to work from home model during this pandemic, we need a solution to address geographic separation as well. So here is the answer! BrowserStack real device cloud provides us 2000+ real devices for on-demand remote testing.

So let’s get started.! Open up the browser and navigate to BrowserStack mobile app testing dashboard https://app-live.browserstack.com . There it is! 

<img src="/img/dw_1_2021_10_14.png"/>

You can choose the preferred source to install your app. As you can see, there are multiple real devices with different OS versions in the dashboard. Tester can choose a device along with OS version depending on the testing requirement, install the app and start testing.

<img src="/img/dw_2_2021_10_14.png"/>

We often test our sprint work as uploaded files, so I’ll go ahead with uploaded Apps. You can simply upload .apk or .aab files for android testing and .ipa files for iOS testing. Previously we had to release the .aab files into play store and use internal tester groups to download and test the app. This was a time-consuming approach to test PBIs and bug fixes which require immediate attention. This is same with iOS test-flight releases too. BroswerStack has saved us from following long-drawn-out processes like that. It allows us to directly upload .aab and .ipa files and install them in a preferred device. On the other hand, tester can upload multiple versions of the app and switch in between different versions to test in different devices. You don’t have to worry about any downloads or configurations to setup. Just upload and start testing 😊

<img src="/img/dw_3_2021_10_14.png"/>

Here I have uploaded .apk file and selected Samsung S21 device with android 11. As you can see, device has installed the app. This side menu consists of features that can control device behavior. You can change device locations, kill, uninstall or install apps and so on. Terminal next to the device shows device status and displays errors if there is any. This log is important for identifying errors. Top bar contains features such as zoom in and zoom out. You can simply change device size using that. User can either switch device and test or simply stop current session and start a new test round while doing testing. Another important feature here is, it supports integrations with tools such as Jira, Git Hub, Slack and few more in the list. So bug reporting is easier with BrowserStack. You can even download screenshots or send emails attaching them. 

Push notifications play an important role in mobile app testing. You must be wondering whether you can test push notifications with BrowserStack. Yes! You can test them on both Android and iOS platforms. 

*	iOS work in progress/ unpublished apps can be installed via TestFlight 
*	iOS published apps can be installed via App Store 
*	Android published apps via Google Play Store
*	Android unpublished apps by uploading .apk or .aab files

<img src="/img/dw_4_2021_10_14.png"/>

We in DGR often use BrowserStack for Usability, Accessibility and Device Compatibility Testing. Since Doing Good App has become a public app, our testing requirements also have extended. BrowserStack has been a great solution for covering up those test scenarios for us. It’s even better for demonstrating end to end test scenarios for sprint reviews as well. If you haven’t tried it before, give it a go and enjoy mobile app testing 😊 

