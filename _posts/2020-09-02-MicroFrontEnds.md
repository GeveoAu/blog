---

title: Micro Frontends

author: Chamika Goonatilaka

linkedin: https://lk.linkedin.com/in/chamikagoonetilaka

description : Good frontend development is hard. Scaling frontend development so that many teams can work simultaneously on a large and complex product is even harder. Hence, the idea of breaking up frontend monoliths into many smaller, more manageable pieces is gaining lot of attention within the tech community.

---

# Micro Frontends

Good frontend development is hard. Scaling frontend development so that many teams can work simultaneously on a large and complex product is even harder. Hence, the idea of breaking up frontend monoliths into many smaller, more manageable pieces is gaining lot of attention within the tech community.

Perhaps you want to tryout the latest frontend framework for a part of the large project that you work on, but can&#39;t find an easy place to start integrating it into the existing code. Perhaps you want to scale your development so that multiple teams can work on a single product simultaneously, but the coupling and complexity in the existing monolith means that everyone is stepping on each other&#39;s toes. Or maybe you just want to improve your frontend deployment process by enabling independent deployments. These are all real problems that can all negatively affect your ability to efficiently deliver high quality experiences to your customers. Hence come the micro frontends.

## Integration of Micro Frontends

There are multiple approaches that could be used to integrate such independently developed frontends (i.e. micro frontends) into a one final frontend application.

### Server-side Template Composition

This is a fairly old approach used in frontend development – rendering HTML on the server out of multiple templates or fragments. We have an _index.html_ which contains any common page elements, and then uses server-side includes to plug in page-specific content from fragment HTML files.

The reason we could justifiably call this as a micro frontend architecture, is because we could split up our code in such a way that each piece represents a self-contained domain concept that can be delivered by an independent team. With the assumption that each of these various bundle of HTML files has their own deployment pipeline, which allows us to deploy changes to one piece without affecting or thinking about any other, this could be treated as a possible micro frontend integration approach, but there are some problems:

- Templating language is basically string interpolation which builds the presentational layer at load time.
- Client-side code is developed separately and has to &quot;pick up&quot; the target elements after it is loaded.

### Build-Time Integration

Another approach that could be used is to publish each micro frontend as a package, and have the container application include them all as library dependencies. Here is how the container&#39;s _package.json_ might look like of a such an application.

```json
{
  "name": "@core-banking/container",
  "version": "1.0.0",
  "description": "Core banking solution",
  "dependencies": {
    "@core-banking/savings": "^1.2.3",
    "@core-banking/fixed-deposits": "^4.5.6",
    "@core-banking/credit-services": "^7.8.9"
  }
}
```

While this approach make sense considering the possibility of practicing independent development, this means that we have to re-compile and release every single micro frontend in order to release a change to any individual part of the product. After going through all of the trouble of dividing our application into discrete codebases that can be developed and tested independently, reintroducing all that coupling during the release stage diminishes the value of the whole process.

### Run-Time Integration via Iframes

By their nature, iframes make it easy to build a page out of independent sub-pages. They also offer a good degree of isolation in terms of styling and global variables not interfering with each other. But this easy isolation also makes them less flexible as well. It can be difficult to build integrations between different parts of the application, so they make routing, history, and deep-linking more complicated, and they present some extra challenges to making your page fully responsive.

### Run-Time Integration via Javascript

This may be the most flexible integration approach when it comes to micro frontends. Each micro frontend is included onto the page using a _\&lt;script\&gt;_ tag, and upon load exposes a global function as its entry-point. The container application then determines which micro frontend should be mounted, and calls the relevant function to tell a micro frontend when and where to render itself.

```html
<html>
  <head>
    <title>Core Banking</title>
  </head>
  <body>

    <!-- These scripts don't render anything immediately -->
    <!-- Instead they attach entry-point functions to `window` -->
    <script src="https://central.corebanking.com/bundle.js"></script>
    <script src="https://savings.corebanking.com/bundle.js"></script>
    <script src="https://fd.corebanking.com/bundle.js"></script>
    <script src="https://credit.corebanking.com/bundle.js"></script>

    <div id="micro-frontend-root"></div>

    <script type="text/javascript">
      // These global functions are attached to window by the above scripts
      const microFrontendsByRoute = {
        '/': window.renderCentral,
        '/savings': window.renderSavings, 
        '/fixed-deposits': window.renderFd, 
        '/credit': window.renderCredit,
      };
      const renderFunction = microFrontendsByRoute[window.location.pathname];

      // Having determined the entry-point function, we now call it,
      // giving it the Id of the element where it should render itself
      renderFunction('micro-frontend-root');
    </script>
  </body>
</html>
```

Unlike with build-time integration, we can deploy each of the _bundle.js_ files independently. And unlike with iframes, we have full flexibility to build integrations between our micro frontends however we like. We could extend the above code in many ways, for example to only download each JavaScript bundle as needed, or to pass data in and out when rendering a micro frontend.

The flexibility of this approach, combined with the independent deployability along with all the other perks of micro frontends, has made this one of the most popular choices when it comes to choosing a micro services integration architecture.

### Run-Time Integration via Web Components

In the approach, each micro frontend is defined as an HTML custom element for the container to instantiate, instead of defining a global function for the container to call.

```html
<html>
  <head>
    <title>Core Banking</title>
  </head>
  <body>

    <!-- These scripts don't render anything immediately -->
    <!-- Instead they each define a custom element type -->
    <script src="https://central.corebanking.com/bundle.js"></script>
    <script src="https://savings.corebanking.com/bundle.js"></script>
    <script src="https://fd.corebanking.com/bundle.js"></script>
    <script src="https://credit.corebanking.com/bundle.js"></script>

    <div id="micro-frontend-root"></div>

    <script type="text/javascript">
      // These element types are defined by the above scripts
const webComponentsByRoute = {
        '/': centralComponant,
        '/savings': savingsComponant, 
        '/fixed-deposits': fdComponant, 
        '/credit': creditComponant,
      };
      const webComponentType = webComponentsByRoute[window.location.pathname];

      // Having determined the right web component custom element type,
      // we now create an instance of it and attach it to the document
      const root = document.getElementById('micro-frontend-root');
      const webComponent = document.createElement(webComponentType);
      root.appendChild(webComponent);
    </script>
  </body>
</html>
```

The end result is quite similar to the previous, while main difference being that you are opting into doing things &#39;the web component way&#39;. If you like the web component spec, and you like the idea of using capabilities that the browser provides, then this is a good approach.

## Summery

In short, micro frontends are all about slicing up monolithic frontend applications into smaller, more manageable pieces, and then being explicit about the dependencies between them. Our technology choices, codebases, teams, and release processes should all be able to operate and evolve independently of each other, without excessive coordination.

In other words, they bring the same advantages that microservices bring to the backends. In fact, one could only use microservices to their full potential if they are being used along with micro frontends. Otherwise, having to deploy a monolithic frontend which is communicating with multiple microservices means you loose key advantages such as independent deployment, scalability, etc.

As frontend codebases continue to get more and more complex over the years, need for more scalable architectures has grown along with it. Whether micro frontends are the right approach for your next big project or not, it will be part of a continuing trend where frontend engineering and architecture is treated with the seriousness that we know it deserves.
