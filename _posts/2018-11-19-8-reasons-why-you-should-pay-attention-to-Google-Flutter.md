---
title: 8 reasons why you should pay attention to Google Flutter
author: Asanka Indrajith
linkedin: https://lk.linkedin.com/in/asanka-indrajith-9510a025
description : Google, Flutter
---

Flutter is Google’s latest cross-platform mobile app SDK for creating native applications for iOS and android. Cross-platform SDK’s are predominately having two approaches:

1. Wrap a web view in a native app container and build a web app that will render inside the web view.

2. Wrap native platform controls and provide a cross-platform abstraction over them.

In both of this approaches, there is an involvement of a bridge that act as a mediator to provide device features and services.

However, Flutter follows a completely new approach as a cross platform mobile development framework. It provides a framework that application developers work against and an engine with a portable runtime to host applications. The framework builds upon the Skia graphics library, providing a new set of widgets that actually rendered, as opposed to being just wrappers on native controls. Therefore, let us just take look at eight reasons that I think why you should pay attention to Google Flutter.

**1. Easy to learn**

One of the first things most developers consider before switching into a new mobile development framework is the learning curve. Leaving a framework that you have mastered after so many years of hard work and migrating to a completely new framework is not easy. Also developers have to start from scratch which makes them afraid to switch technologies. However thankfully, Flutter has a small learning curve, which makes it easier for developers to switch into Google flutter. In fact, I would say that it’s a piece of cake, if any of you have any experience with native or hybrid mobile application development. 

Actually all you have to learn is Dart. Dart is a programming language originally developed by Google. Dart offers an intersection of features that should be familiar to developers coming from a variety of languages, such as C#, JavaScript, F#, Swift, and Java. Actually it only took me couple of days to master Dart. As both Flutter and Dart are open-source, there is extensive documentation and excellent community support to help you out with learning and any issue you would encounter.

**2. Great performance**

Dart compiles into native code and there is no need to access OEM widgets as Flutter has its own. All your code will be converted into C++ code, which will run with the native level performance on both Android and iOS by the portable C++ engine that comes with flutter. This means less mediated communication between the app and the platform. Flutter might be the only mobile framework that provides reactive views without requiring a JavaScript bridge. All of this contributes to fast app startup times and less performance issues.

**3. Very easy to develop UI**

In Google flutter, creating UI is very easy. It’s all thanks to the core principle of Flutter, where everything is a widget. Your app class is a widget; your whole layout structure is a widget (Scaffold); basically, everything is a widget (AppBar, Drawer, SnackBar, etc.). For an example, if you want your control to be centered? All you have to do is wrap it with a Center widget. Thanks to this, Entire app can be represented as a widget hierarchy and creating UI is as simple as composing layouts with many different small parts, which have their own properties.

Since Flutter does not make use of the Platform OEM Widgets and provide full access to its UI framework, it extremely easy for developers to customize their UI and widgets while increasing their flexibility.

<img src="/img/asanka_0.png" height="400" width="600" />

**4. Full set of widgets**

Flutter already have a very rich set of built-in UI components which ships with Flutter. In addition, there are plentiful of other third party UI components as well. They have two sets of widgets- for Android they have Material designed widgets and for iOS they have Cupertino based widgets. Therefore, you can develop your android application to look like a native android app and your iOS app to look alike a typical iOS app. Differences are not only in colors but also in dimensions, styles and behavior of widgets.

<img src="/img/asanka_1.png" height="400" width="600" />

**5. Massive Library of Plugins**

Mobile app developers clearly know the importance of plug-ins as it takes the hassle out of mobile app development process. It makes your life easy by providing features and services that you may have to develop from scratch unless. However, fortunately Flutter has a massive library of plugins, tools, and packages to make your life easy: such as for opening images, making HTTP requests, sharing content, storing preferences, accessing sensors, implementing Firebase, and many more. And Of course, everything supports both Android and iOS.

<img src="/img/asanka_2.png" height="400" width="600" />

**6. Hot reload**

Flutter allows you to rebuild your app instantly as if it was just a web page. This allows a running application to be modified in many cases, maintaining state, without having to stop the app, rebuild and redeploy. Hot reload increases development efficiency drastically by allowing quicker development. It really makes the platform a pleasure to work with. 

<img src="/img/asanka_3.png" height="400" width="600" />

**7. The same app UI on older devices**

Your app will look the same, even for old versions of Android and iOS systems. There is no additional work required for supporting older versions. Flutter runs on Android Jelly Beans or newer, as well as iOS 8 or newer. This is because Flutter does not rely on native platform controls but its own controls. This also means less time spent on testing.

**8. Multiple IDE support**

Flutter support 3 major IDEs; Android studio, IntelliJ and Visual Studio Code. Therefore, you can choose whatever IDE you are comfortable and start coding. Also Flutter provides terminal support so you can code flutter using your own preferred code editor.

## Conclusion

Therefore, Flutter offers great many features for building cross-platform applications. Also in future, Flutter developers will be able to target Fuchsia in addition to iOS and Android. In addition, if you are running a business and building hybrid apps daily, then you should definitely consider flutter a top priority before making your choice. With a growing community, it is a great time to jump in.

## References

[https://flutter.io/](https://flutter.io/)

[https://hackernoon.com/flutter-5-reasons-why-you-may-love-it-55021fdbf1aa](https://hackernoon.com/flutter-5-reasons-why-you-may-love-it-55021fdbf1aa)

[https://android.jlelse.eu/all-the-reasons-flutter-can-make-your-heart-flutter-or-not-94bf99677634](https://android.jlelse.eu/all-the-reasons-flutter-can-make-your-heart-flutter-or-not-94bf99677634)

[http://www.agiratech.com/7-reasons-why-google-flutter-should-be-your-next-choice/](http://www.agiratech.com/7-reasons-why-google-flutter-should-be-your-next-choice/)

