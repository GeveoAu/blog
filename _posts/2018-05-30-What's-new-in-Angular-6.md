
---
title: What is new in Angular 6.0 (Angular 2.0)
author: Aruna Perera
linkedin: 
description : Angular6, Angular
---

AngularJS is a JavaScript-based open-source front-end web application framework maintained by Google, which combines declarative templates, dependency injection, end-to-end tooling and integrated best practices to solve development challenges. In addition, Angular JavaScript components complement Apache Cordova, a framework used for developing cross-platform mobile apps. 

Google released the initial version on October 20, 2010, and the latest stable version was released on last May 11, 2018. Angular 2.0 was a complete re-write of the initial AngularJs version 1.0 entirely based on components. Most importantly, this release makes Angular lighter, faster and easier. Moreover, it will make developers’ life easier on upcoming Angular versions.

As you many know Angular 6 is already out there as a preview version, let’s find out the upcoming features and enhancements.  

* Angular Material (elements)

    * UI Component Framework

    * Offers 30+ UI components

    * A New mat-tree

    * Virtual Scrolling

    * Drag-and-drop helpers 

In March 2016, the initial version of Angular Material was released but was lacking in the number of components, stability, and compatibility with latest angular versions. The latest release on angular 6.0, now it has become more stable and compatible. The ultimate goal of this package is to create an Angular component and publish it as a Web Component, which can be used in any HTML page that is being supported by all modern browsers (Except Edge). The main benefit of this is, once you create and publish a web component, you can use it in a non-SPA app.

* CDK Stable Release

    * Helps to build own custom components

    * Google Cloud Platform

    * Google Shopping Express

    * Google Analytics Suite

    * Developer Console

With this release, CDK Toolkit is stable and Developers can use this toolkit to build their own components using Angular Material which is also supported Responsive Web Design layouts eliminating the need for using libraries like Flex Layout or learning CSS Grid with less effort as this toolkit already has most of the commonly used utilities to build components.

* Service Worker Support (CLI Version 1.7)

    * Schematics Support

    * ng update

    * Service Worker API

    * App Budgets

    * Performance improvement

Angular CLI generates Angular artifacts using the technology called Schematics that enables developers to create a new component, or updating the code to fix breaking changes in a dependency or to add a new configuration option or new framework to an existing project. By using "ng update" it automatically updates the project dependencies and makes automated version fixes by itself. 

Service worker is a script that runs in the web browser and manages to cache for an application. In the older version, when we do the latest deployment of the application it may need to deactivate/uninstall the existing service worker. With this new release, it contains new script file safety-worker.js, which will be a part of production bundle that helps us to unregister existing service worker.

It is common that introducing new functionality/features to the application gradually increases the size of the application bundle size. App Budgets is a handy feature in the Angular CLI, which allows developers to set threshold values for the size of bundles that will enable to configure error messages/warning messages when bundle size grows beyond the configured threshold.

* Improved Angular Universal - Generates static application pages on the server side – Server-Side rendering  (Ivy Renderer)

    * Facilitate web crawlers

    * Improve performance of the application on mobile and low-powered devices

    * Display the first page quickly

The Angular team has introduced a new backward-compatible renderer which will make the size of the app smaller and the compilation faster. Switching to Ivy rendered will be smooth, and the Angular team has promised it will be a non-breaking change for existing implementations.

* Typescript support 2.7

This new release of the Angular version with TypeScript will be much easier to code with conditional type declarations, default declarations and strict class initialization. Please refer this [link](https://github.com/Microsoft/TypeScript/wiki/What's-new-in-TypeScript) to read the full spec of latest additions to TypeScript version.

* Added navigation Source and restoredState to NavigationStart

In Angular old versions, there is no direct way of knowing if navigation was triggered imperatively or via the location change. In latest Angular version, it has introduced "navigationSource" to identify the source of the navigation. Moreover, the “restoredState” will give the restored navigation id, which leads to current navigation. These two properties are useful to handle multiple use cases in routing.

* Dependency Injection Simplified 

As you know, when we introduce a service or annotated a class with @Injectable, we have to register in app module under providers section. With the new changes in Angular 6, you can specify "providedIn" and it will auto-register itself when the app bootstraps.

@Injectable({

  providedIn: 'root'

})

* Bazel and Closure Compiler

Most of software built by Google, including over 300+ Angular apps were built by using Bazel build system. Since the source code changes often, it does not make sense to rebuild the entire application for every little change instead Bazel only rebuilds what is necessary. The Closure Compiler is capable of consistently generates smaller bundles and does a better job in dead code elimination compared to Webpack and Rollup bundlers.

