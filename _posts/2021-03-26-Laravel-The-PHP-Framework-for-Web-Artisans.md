---

title: Laravel - The PHP Framework for Web Artisans

author: Harin Samaranayake

linkedin: https://www.linkedin.com/in/harinsamaranayake/

description : Laravel is considered the PHP Framework for Web Artisans. According to hackr.io, it is the best PHP
framework in 2021. It was developed by Taylor Otwell in June 2011. Laravel is free and open-source. It
follows the Model–View–Controller (MVC) architectural pattern.

---

**Laravel - The PHP Framework for Web Artisans**

<img src="/img/hs_1_2021_03_26.jpg" />

Laravel is considered the PHP Framework for Web Artisans. According to hackr.io, it is the best PHP framework in 2021. It was developed by Taylor Otwell in June 2011. Laravel is free and open-source. It follows the Model–View–Controller (MVC) architectural pattern.

In this blog post, you will learn how to create a simple CRUD application using Laravel.

Before we dig into the application there are several prerequisites.

**XAMPP** - Apache PHP MySQL (https://www.apachefriends.org/index.html)
**Composer** - PHP Dependency Manager (https://getcomposer.org)
**VSCode** - Editor (https://code.visualstudio.com)

Common terms used in the Laravel eco system.

**Composer** - PHP dependency manager
**Artisan** - Command Line Interface (CLI)
**Tinker** - CLI to interact with the Database
**Eloquent** - Object Relational Mapper (ORM)
**Blade** - PHP templating engine

Once you have set up the above-mentioned requisites a Laravel application can be created.

### **Setup**
- Navigate to the htdocs folder in the xampp using the intergraded terminal of VSCode.
- Execute the following command to create a new app.
``` 
composer create-project laravel/laravel app_name
```
- Execute the following command to start the server.
``` php
php artisan serve
```

### **Laravel File structure**

Commonly used files in the Laravel framework and their locations are listed below.

1. models /app/Models
1. views /resources/views
1. controllers /app/Http/Controllers
1. routes /routes/web.php
1. database /.env
 
### **Routes**

There are mainly four types of routes in Laravel.

1. GET
1. POST
1. PUT
1. DELETE

The route structure is shown below. route_type defines the type of the route. URL defines the pointing URL while the action defines the activity to be carried out once the endpoint is hit.

**Structure**
```php
Route::route_type(url, action);
```
Routes reside in the /routes/web.php file. Below is an example of a simple GET and a POST route.

**GET**
```php
Route::get('/', function () { return view('index');});
```

**POST**
```php
Route::post('/', function () { return view('index');});
```

In the action, you can return different things or call a controller function.

**Returning a string**
```php
Route::get('/', function () { return ‘Hello World’;});
```

**Returning a html string**
```php
Route::get('/', function () { return ‘<h1>Hello World</h1>’;});
```

**Returning a .blade view**
Route::get('/', function () { return view('index');});

**Calling a controller function**
Route::get('/shop', [ItemController::class, 'index']);

The following command will return all the routes available in the application:

```php
php artisan route:list
```

### **Views**

In Laravel .blade files provide the functionality to use PHP code within HTML code sippets.
```php
<h1><?php $var = 'test' ?></h1>
```

In blade, three main methods reduce code redundancy:
1. @extends()
1. @yeild()
1. @include()

**@extends()** method is used to import a complete blade file to the calling blade file. **@include()** method defines locations where externally defined code snippets are placed. **@yeild()** method defines locations where internally defined code snippets are placed. When defining internal code snippets, it should be defined between **@setion()** and @endsection blocks.

### **Controllers**

In the Laravel framework Controllers are created under app/Http/Controllers folder. Controllers can be generated using the following artisan command.

```php
php artisan make:controller NameController
```
A simple controller structure.

```php
class ItemController extends Controller
{
public function index(){
return view('shop');
}
}
```

There are few steps when calling a controller function from a route.
- Include the controller in route
```php
use App\Http\Controllers\ItemController;
```

- Call the controller method
```php
Route::get('/shop', [ItemController::class, 'index']);
```

Laravel provides the facility to create the routes parallelly when creating controllers. It is done by executing the following command.

```php
php artisan make:controller NameController --resource
```

There is a special way to call such a controller from the route file. It is defined below.

**Structure**
```php
Route::resource(name,controller_path);
```
**Example**
```php
Route::resource('item','App\Http\Controllers\ItemController');
```

### **Setting up database**

Database settings are stored in a .env file. As an example, you can connect to a SQL database as follows.
```php
DB_CONNECTION = mysql - database connection type
DB_HOST = 127.0.0.1 - database host url
DB_PORT = 3306 - database port
DB_DATABASE = laravel - database name
DB_USERNAME = root - database username
DB_PASSWORD = password - database password
```

### **Models**

In Laravel models can be created by executing the following artisan command. They are created under the **app/Models** folder.

**Structure**
```php
php artisan make:model ModelName
```

**Example**
```php
php artisan make:model Items
```

Laravel provides the functionality to create models while adding migrations.

**Structure**
```php
php artisan make:model ModelName -migration
php artisan make:model ModelName -m
```

**Example**
```php
php artisan make:model Items -m
```

Once we execute the above commands a migration file is generated. A migration file has a **up()** and a **down()** function. They are responsible for creating and deleting a table. A simple up() function is shown below.

```php
public function up()
{
Schema::create('items', function (Blueprint $table) {
$table->id();
$table->string('title');
$table->string('description');
$table->string('url');
$table->timestamps();
});
}
```

Once the migrations are setup you can execute the migrations using the following artisan command.

```php
php artisan migrate
```
Already created migration can be updated using the table() function as follows.

```php
public function up()
{
Schema::create('items', function (Blueprint $table) {
$table->id();
…
});
Schema::table('items', function (Blueprint $table) {
$table->integer('price');
});
}
```

To reset the existing migration, you need to execute the following artisan command.

```php
php artisan migrate:reset
```

### **Tinker**

Tinker is used to interactingwith the database from the terminal. To invoke Tinker execute the following
command.

```php
php artisan tinker
```
Given below is a sample Tinker commands to create and save an Item object.

```php
>>> $item = new App\Models\Item();
=> App\Models\Item {#3346}
>>> $item->title = "Sofa"
=> "Sofa"
>>> $item->description = "Best sofa in the world"
=> "Best sofa in the world"
>>> $item->url = "https://"
=> "https://"
>>> $item->save()
```

The same Tinker commands can be used within the controller functions as well. The way to create, save, search, update and delete objects using Tinker is given below.

**Save**

```php
$item = new Items();
$item->title = "Sofa";
$item->save();
```
**Search**
```php
$item = Items::where('id', 1)->first();
```
**Update**
```php
item = Items::where('id', 1)->first();
$item->title = "Sofa2";
$item->save();
```
**Delete**
```php
$item = Items::where('id', 2)->first();
$item->delete();
```

This blog post explained the basics of the Laravel framework with the related code snippets. I believe that this is a good starting point for someone new to the framework. Wishing you all a happy coding experience.

### **References**

1. https://laravel.com
1. https://getbootstrap.com
1. https://stackoverflow.com
1. Traversy Media | https://www.youtube.com/channel/UC29ju8bIPH5as8OGnQzwJyA
1. https://pixabay.com
1. https://www.presentationgo.com


