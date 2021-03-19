---

title: Introduction to Flask Micro Web Framework

author: Shakthi Sachintha

linkedin: https://www.linkedin.com/in/shakthi-sachintha/

description : Flask is a lightweight web application framework written in Python. It was initially released on April 1, 2010. The mind behind this awesome framework is Armin Ronacher who is an Austrian software programmer. The initial idea behind this framework was an April fool’s joke, which was so popular enough to make it a real application. It was the most popular web framework in the Python Developers survey 2018.

---

**Introduction to Flask Micro Web Framework**

<img src="/img/ss_1_2021_03_19.png" height="470 " width="1200 " />

Flask is a lightweight web application framework written in Python. It was initially released on April 1, 2010. The mind behind this awesome framework is Armin Ronacher who is an Austrian software programmer. The initial idea behind this framework was an April fool’s joke, which was so popular enough to make it a real application. It was the most popular web framework in the Python Developers survey 2018.

Flask is being used by many large companies and are scaling and going strong (Pinterest, Reddit, Twilio, LinkedIn, Mailgun).

Flask is classified as a microframework as it does not come with any database abstraction layer, form validation, or any other components. Programmers are free to use any existing third-party libraries to achieve those functionalities.

Flask is based on Pocoo projects, Werkzeug and Jinja.

### **Werkzeug**

Werkzeug is a utility library for python, it is a toolkit to implement web server features in python. In other words, it is providing support for Web Server Gateway Interface (WSGI).

### **Jinja**

Jinja is a templating engine by the same developer Armin Ronacher. It serves as the default templating engine for the Flask framework. Even though this is the default templating engine, it is free to use any templating engine that programmers prefer. Many templating engines provide support for Flask (Mako, Genshi, Cheetah are some of them).

### **Features of Flask**

- Lightweight and modular design
- Inbuilt development server and debugger
- High flexibility
- Minimal coding
- Server-side rendering

### **Let start coding**

**Installation**

- Install python 3.0 or higher version
- In terminal run > pip install flask

Once you have done this you are ready to go

Hello world!'

```py
from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return "<h1>Hello World</h1>"

app.run(host="localhost", port=5000, debug=True)
```

First, you have to import the Flask class from the flask module, then you can create a new Flask app, you have to pass the app name as the first parameter to the constructor. 

We define a simple route and a hello world function to return an HTML markup.

Finally, we run the app in the debug mode using app.run() function.

### **Routing and HTTP methods**

When it comes to routing Flask supports all the features that other frameworks support. You can pass routing parameters, query strings, routing middleware also it supports all HTTP methods (HEAD, GET, PUT, POST, PATCH, DELETE). 

```py
from flask import Flask, request

app = Flask(__name__)

@app.route("/courses", methods = ['GET', 'POST', 'PUT', 'DELETE'])
def course_controller():
    if (request.method == 'GET'):
        return "GET request recieved"

    if (request.method == 'POST'):
        name = request.form.get("name")
        id = request.form.get("id")
        return f"<h2>ID = {id} Name = {name} </h2>"

    if (request.method == 'PUT'):
        return "PUT request recieved"

    if (request.method == 'DELETE'):
        return "DELETE request recieved"


# starting the development server
app.run(host="localhost", port=5000, debug=True)
```

You can accept every HTTP method into a single function and act accordingly. We have to mention which methods the route accepts, to do that we have to pass an array of methods (if it is not present it will accept GET requests as default) to the function decorator as a parameter.  And we can get the request’s method by using the request module provided by Flask.

Flask supports four types of routing parameters
- String
    - The default type for parameters. If the type is not annotated Flask will consider them as strings.
- Int
    - Accepts only integer parameters, will throw not found error when any other type presents or the parameter not presents.
- Float
    - Accepts only floating-point values.
- Path
    - Accepts path strings, slashes used as a directory separator character
ex: (public/images/image.jpg)

```py
from flask import Flask, request

app = Flask(__name__)

@app.route("/")
def route_hello_world():
    return "<h1>Hello, World!</h1>"

# string type (default)
@app.route("/hello/<string:name>")
def route_hello(name):
    return f"<h1>Hello, {name}!</h1>" 

# integer type
@app.route("/blog/<int:postId>")
def route_blog(postId):
    return f"<h1>Welcome to blog : blog post - {postId}</h1>"

# float type
@app.route("/documentation/<float:version>")
def route_documentation(version):
    return f"<h1>Documentaion Version - {version}</h1>"

# path type
@app.route("/resources/<path:resource_path>")
def route_resources(resource_path):
    return f"<h1>Resource Path - {resource_path}</h1>"

# query params
@app.route('/search')
def search():
    keyword = request.args.get("keyword")
    sort = request.args.get("sort")
    return f"keyword = {keyword} sort = {sort}"


# starting the development server
app.run(host = "localhost", port = 5000, debug = True)
```

Each routing parameter will be passed into the underlying function as separate parameters. We can use those parameters inside the function to program any logic we want.

Query parameters can be accessed using the request module ( request.args.get(‘param_name’) ).

There are lot more features in Flask that cannot be wrap into a single blog post. To learn more you can refer to the following references

### **Reference**

Flask Official Documentation [ https://flask.palletsprojects.com/en/1.1.x/ ]
Flask Tutorials [ https://www.tutorialspoint.com/flask/index.htm ]
Wikipedia [ https://en.wikipedia.org/wiki/Flask_(web_framework) ]
Jinja Templating Engine [ https://jinja.palletsprojects.com/en/2.11.x/ ]
Flask intro source code [ https://github.com/shakthisachintha/Flask-Demo ]


