---

title: Static Site Generator for Angular

author: Moreen Hettihewa

linkedin: https://lk.linkedin.com/in/moreenhettihewa

description : Nowadays, static site generators are becoming very common due to the nature of generating a static site. It can run the entire website without server-side code making the website faster and more performant. 

---
___

Nowadays, static site generators are becoming very common due to the nature of generating a static site. It can run the entire website without server-side code making the website faster and more performant. 

*Nuxt.js* (Vue.js),  *Gridsome* (Vue.js),  *Next.js* (Next.js),  *Gatsby* (React),  *Jekyll*, and  *Hugo* are some of the most popular static site generators.


A static site generator is a tool that leads to generating a full static HTML website based on raw data and a set of templates. Moreover, it automates the task of coding individual HTML pages and gets those pages ready to serve. Because these HTML pages are pre-built, they can load very quickly. Some of the advantages of using static site generators are described as follows:
 
#### **Performance**

The static site generator’s process of producing static templates is very effective as it does not have database queries or backend calls as it instantly loads to the user.

#### **Better security**

Since static sites are typically generated on one machine and then served from a different one, there is not much an attacker can do to the webserver serving the static files.

#### **Fewer server-related requirements**

Don’t have to bother with installing several plugins and updates related to the server-side.

#### **Traffic surges handling**

Due to having very few server resources required to serve static HTML files, it avoids issues such as database crashes, and restriction of active connections.


However, there are some disadvantages like unavailability of real-time data, lack of user-generated content and so on.


Let’s see how static site works.

<img src="/img/mh_1_2022_04_07.png"/>

The above picture depicts how it works. A set of HTML templates and raw data are processed by a static site generator resulting in an accessible static site.


In conclusion, we put all the content on pages. So, it makes pages available to end-users as blog posts or portfolios.
 


## **Introducing Scully to Angular Application**

Due to the popularity of static site generators, developers came up with Scully. The following figure shows how it does.

<img src="/img/mh_2_2022_04_07.png"/>

Our Angular application consists of components, services, modules, and assets. So, it is going through a set of commands separately for angular build and Scully build resulting set of HTML files in a static folder in dist.

Now let’s see how to make use of Scully in our Angular application. 

#### **Installation**

Add the following command in your angular application. It will install @scullyio/init, @scullyio/ng-lib, and @scullyio/Scully package. It will import ScullyLibModule in AppModule and update other relevant files on the angular application. 


```
ng add @scullyio/init
```

#### **Building**
 
First, do an Angular build that leads to a dist folder with relevant files.

```
ng build
```

Then run build for Scully. It will create a static folder in the dist with a set of index.html files. It will scan the routes of your angular application and generate index.html files for each route as well. 

```
npx scully
```

<img src="/img/mh_3_2022_04_07.png"/>

#### **Serving**

The following command launches two servers. One server is due for the Angular build and the other one is for the static server for Scully build. This allows you to test both versions of your built application.


```
npx scully serve
```


This way you can build the static site from your angular application. 

Happy coding!

#### **References**

https://scully.io/docs/learn/getting-started/overview/