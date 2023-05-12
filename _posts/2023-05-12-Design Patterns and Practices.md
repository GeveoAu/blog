---

title: Design Patterns and Practices.

author: Kanchana Kariyawasam.

linkedin: https://www.linkedin.com/in/kanchana-kariyawasam-b069b21aa/

description: In this blog, I will discuss Software Design Patterns that are essential in coding. Design patterns are common solutions to problems that software engineers face during the development process. These types of solutions have been identified by many experienced Software Engineers. In addition, Experienced software engineers who mainly use object-oriented concepts use Design Patterns as one of the best practices.

---
___
In this blog, I will discuss Software Design Patterns that are essential in coding. Design patterns are common solutions to problems that software engineers face during the development process. These types of solutions have been identified by many experienced Software Engineers. In addition, Experienced software engineers who mainly use object-oriented concepts use Design Patterns as one of the best practices.

Furthermore, there are 25 design patterns that can be categorized into 3 main categories such as,
1. 	Creational Design Patterns
2. 	Structural Design Patterns
3. 	Behavioral Design Patterns

#### **Creational Design Patterns**
This type of design pattern is mainly used for creating and instantiating objects of a class. Hence, Software Engineers can reduce complexities and increase clarity by using creational design patterns. Mainly, 
1. 	Singleton Pattern
2. 	Builder Pattern
3. 	Prototype Pattern
4. 	Object Pool Pattern
5. 	Abstract Factory Pattern
6. 	Factory Method Patterns can be expressed as creational design patterns.

#### **Structural Design Patterns**
Structural design patterns identify a simple way to achieve relationships between entities. Hence, it can give methods for creating classes and objects which can be reusable for many solutions.
Mainly,
1. 	Facade Pattern
2. 	proxy Pattern
3. 	Adapter Pattern
4. 	Bridge Pattern
5. 	Composite Pattern
6. 	Flyweight Pattern
7. 	Decorator Patterns can be expressed as structural design patterns.

#### **Behavioral Design Patterns**
Behavioral design patterns can be used when objects must interact with others and each type of object has responsibility. Each object must have a particular responsibility, and the relationship between them should be such that they can simply communicate with one another while being loosely coupled.  Mainly,
1. 	Chain of Responsibility Pattern
2. 	Command Pattern
3. 	Interpreter Pattern
4. 	Iterator Pattern
5. 	Mediator Pattern
6. 	Memento Pattern
7. 	Observer Pattern
8. 	State Pattern
9. 	Strategy Pattern
10.  Template Pattern
11.  Visitor Pattern
12.  Null Object
 

In Total, there are 25 design patterns. However, software engineers mainly use several design patterns rather than use all the design patterns. Hence, I will discuss several design patterns in depth which are commonly used by experienced software engineers.

#### **1.	Singleton Design Pattern**
As you know, Singleton is a creational pattern. This means creating only one instance of a class. Hence there is only one global access point to the instance. Because of that, developers can manage pools of resources for their code. Developers create a private static variable for holding an instance of a class. Also, there is a private constructor. Hence, developers must instantiate objects through the class itself rather than from the outside classes. However, this class (Singleton Class) has a method called getInstance() to get the single instance.

Furthermore, there are three ways to implement the singleton class. 

#### ***Lazy Instantiation***
In this method, there are not any instances or not to create instances if the developer does not require them. Hence, this is a more reliable method for creating a Singleton class.

 ```
 public class SingletonLazy {
    private static SingletonLazy st;
    //private constructor
    private SingletonLazy()
    {

    }
    //public access point
    public static SingletonLazy getInstance()
    {
        if(st == null)
        {
            st = new SingletonLazy();
        }
        return st;
    }
}
 ```
#### ***Eager Instantiation***
In this method, there are instances or create instances if the developer requires or does not require. Hence, this method is a costly method rather than Lazy Instantiation.
 ```
public class SingletonEager {
    private static SingletonEager st;

    //private constructor
    private SingletonEager()
    {

    }

    //public access point
    public static SingletonEager getInstance()
    {
        return st;
    }
}
 ```
#### ***Thread-Safe Instantiation***
Since these methods are not thread-safe, developers cannot work in environments like multi-threads. As the solution for that issue, developers use thread-safe instantiation methods by using synchronized keywords. Most of the time, developers use this method because when they have to work with multi-thread calling the singleton simultaneously.
 ```
public class SingletonThreadSafe {
    private static SingletonThreadSafe st;

    //private constructor
    private SingletonThreadSafe()
    {

    }
    //public access point
    public static synchronized SingletonThreadSafe getInstance()
    {
        if(st == null)
        {
            st = new SingletonThreadSafe();
        }
        return st;
    }
}
 ```
#### **2. Factory Method Pattern**

Most of the time, developers use factory method patterns when they need to instantiate several instances of objects that have similar behaviors, but the classes that are created can change based on runtime conditions. Hence, this method provides an interface to create objects whereas each subclass can determine which class should be instantiated. Furthermore, this pattern uses the Polymorphism OOP concept.
Let’s discuss this method by taking an example. Assume that there is an interface called “Calculator” with a method called “calculate()”. 
```
public interface Calculator {
    public void calculate(double number_1, double number_2);
}
 ```
In addition, there are two classes called “Addition” and “Divider” which implement the “Calculator” interface and override its method.

```
public class Addition implements Calculator
{
    @Override
    public void calculate(double number_1, double number_2) {
        System.out.println("Addition = "+(number_1+number_2));
    }
}
 ```
 
 ```
public class Divider implements Calculator{
    @Override
    public void calculate(double number_1, double number_2) {
        System.out.println("Division = "+(number_1/number_2));
    }
}
 ```
 Also, there is a class called “Calculations” which is used to instantiate objects of the “Addition” and “Divider” classes. 
 ```
public class Calculations {
        public Calculator getValues(String function)
        {
            Calculator ct = null;
            if(function.equalsIgnoreCase("addition"))
            {
                ct = new Addition();
            } else if (function.equalsIgnoreCase("division")) {
                ct = new Dividor();
            }else {
                System.out.println("Enter correct function");
            }
            return ct;
        }
}
 ```
In the end, there is a main class that is used to pass the required parameters.
 ```
import java.util.Scanner;

public class Main {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);

        System.out.println("Input Number : ");
        double number1 = input.nextDouble();
        System.out.println("Input Number : ");
        double number2 = input.nextDouble();

        System.out.println("Enter function that you want (addition/division) : ");
        Calculations res = new Calculations();
        Calculator result = res.getValues(input.next());

        result.calculate(number1,number2);
    }
}
 ```
 As you can see from the example above, we can abstract the process of creating objects and provide an interface to the clients. 

#### **3.	Observer Design Pattern**
Developers use this design pattern when they have dependencies between objects. There are one-many dependencies between objects. Furthermore, there are two main entities called subject and observer. The subject should be observed, and the observer observes the subject. All the registered observers are informed when the subject changes. Hence, they can respond to the changing status of the subject.
 ```
public interface ISubject {
    void registerObserver(Observer o);
    void removeObserver(Observer o);
    void notifyObservers();
}
 ```
 ```
import java.util.ArrayList;
import java.util.List;
public class WeatherClass implements ISubject {
    private List<Observer> observers;
    private float temperature;
    private float humidity;
    private float pressure;

    public WeatherClass()
    {
        observers = new ArrayList<>();
    }

    @Override
    public void registerObserver(Observer o) {
        observers.add(o);
    }

    @Override
    public void removeObserver(Observer o) {
        observers.remove(o);
    }

    @Override
    public void notifyObservers() {
        for (Observer observer : observers) {
            observer.update(temperature, humidity, pressure);
        }
    }
    public void setMeasurements(float temperature, float humidity, float pressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        this.pressure = pressure;
        measurementsChanged();
    }
    private void measurementsChanged() {
        notifyObservers();
    }
}


 ```
 ```
public interface Observer {
    void update(float temperature, float humidity, float pressure);
}
 ```
 ```
public class ConditionClass implements Observer{
    private float temperature;
    private float humidity;
    private ISubject weatherData;

    public ConditionClass(ISubject weatherData) {
        this.weatherData = weatherData;
        weatherData.registerObserver(this);
    }

    public void update(float temperature, float humidity, float pressure) {
        this.temperature = temperature;
        this.humidity = humidity;
        display();
    }

    public void display() {
        System.out.println("Current conditions: " + temperature + "F degrees and " + humidity + "% humidity");
    }
}
 ```
 ```
public class MainClass {
    public static void main(String[] args) {
        WeatherClass weatherStation = new WeatherClass();
        ConditionClass currentDisplay = new ConditionClass(weatherStation);

        weatherStation.setMeasurements(80, 65, 30.4f);
    }
}
 ```

The "ConditionClass" class is the observer in this example, while the "WeatherClass" class is the subject. The "WeatherClass" keeps track of all the registered observers, and when its state changes, it calls each observer's "update" function to let them know. To display the current temperature and humidity, the "ConditionClass" implements the "update" function and registers itself as an observer when it occurs.
As I mentioned above, I have discussed the main three design patterns which are relevant for each of the three sub-categories. Furthermore, I have implemented some examples of design patterns by using Java. Because of that, readers can easily understand these concepts.  
