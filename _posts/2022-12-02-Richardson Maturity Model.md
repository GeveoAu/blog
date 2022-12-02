---

title: Richardson Maturity Model

author: Sanidu Lakmal

linkedin: https://www.linkedin.com/in/sanidu/

description: Richardson Maturity Model is developed by Leonard Richardson, that breaks down the principal elements of a REST approach into three steps. These introduce resources, http verbs, and hypermedia controls.

---
___
The model is introduced by Leonard Richardson, When the software industry transferring from POX (Plain Old XML) to Rest.
To achieve the Glory of Rest, it should climb up the levels. The RMM is explained in 4 levels of Maturity.

<img src=”sl_1_2022_12_02.jpg” height="191 px" width="786 px" />

#### **Level 0**

This level is called No REST, or the swamp of POX. Which has one end point with HTTP POST only, based on the payload on the body the application detects what must be done and what would be the output.
Ex: Soap (Simple Object Access Protocol).

#### **Level 1**

Applications with this level are using to use multiple endpoints (Resources). But still uses HTTP POST only.


#### **Level 2**
This is the most used maturity in most of the applications. Application with this level can use multiple endpoints (Resources) with HTTP verbs, not restricting to POST.
-	GET – Retrieve a resource
-	POST – Add a resource
-	PUT – Update a Resource
-	DELETE – Delete a Resource.

Using those with standard URLs for resources is also achieved in this level.
/employees – GET (Retrieve All), POST (Add an Employee)
/employees/{id} – GET (Retrieve one with ID), PUT (will update one with ID), DELETE (delete one with ID).

#### **Level 3**

On the top, most matured level is with HATEOAS (Hypertext as The Engine of Application State). It's also known as Hypermedia Controls, which basically consists of resource links.
The point of hypermedia controls is that they tell us what we can do next, and the URI of the resource we need to manipulate to do it. Rather than us having to know where to post our appointment request, the hypermedia controls in the response tell us how to do it.

Ex: GET => /employees/{id} will retrieve the entity which has the given ID, with link rels which tells what can be done next.

>{
    "id": 10,
    "firstName": “Kusal”,
    "lastName": “Janith”,
    "departmentId": 5,
    "designationId": 1700,
    "links": [
        {
            "href": "10/promote",
            "rel": "employees",
            "type”: "PUT"
        },
       {
            "href": "10/demote",
            "rel": "employees",
            "type”: "PUT"
        }
    ]
} 

>


### **For further reference**

★   https://martinfowler.com/articles/richardsonMaturityModel.html

★	Devopedia. 2020. "Richardson Maturity Model." Version 6, July 24. Accessed 2022-10-09. https://devopedia.org/richardson-maturity-model

