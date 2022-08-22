---

title: Virtualization Technologies

author: Madushi Sarathchandra

linkedin: https://www.linkedin.com/in/madushi-sarathchandra/

description : Virtualization is a fundamental technological innovation that helps you to deploy creative solutions by mitigating the different business challenges. If you are a person who willing to learn about emerging technologies, take a few minutes to go through this blog post. This will surely help you to get some insight about virtualization technologies.


---
___

#### **What is Virtualization?**

<img src="/img/MS_1_2022_08_19.jpg" height="198.80" width="498.89" />

 If you think about the word ‘virtual’, which means that it is not physically tangible. In cloud computing, virtualization is the process of making a virtual representation of IT resources by generalising them. That means, separating the resources or requests for a service from the underlying physical delivery.
 
 
Let’s say you have a single server that has four cores, 64 bits of memory and 2TB of hardware storage. If you break it down into multiple computers that have one core, 8 bits of memory per each. Physically you have one server and make it look like a collection of servers that are connected through a network. That is virtualization.


The virtual infrastructure provides a layer of abstraction between computing resources like storage, networking, memory and the applications running on it. The deployment of virtual infrastructure should not be disruptive for the user experiences, as they are unchanged with virtualization technologies. 
Here you can see how virtualization provides hardware independence from the operating systems and applications. 


<img src="/img/MS_2_2022_08_19.jpg" height="201.07" width="461.10" />


Virtualization is a great way to optimise resource utilisation by reducing the operational cost. It helps to utilise the hardware resources. If you deploy everything in physical servers, it is obviously going to be under utilised the hardware resources. Sometimes, we do not need to run all the resources at the same time. Sometimes they have different schedules and different requirements. Then hardware resources might be wasted without virtualization. Then the energy cost and the IT operation cost might also be high. 

<img src="/img/MS_3_2022_08_19.jpg" height="271.37" width="370.77" />


Virtualization helps legacy applications to run on a newer platform by doing the translation between new hardware and the previous hardware through the virtualization layer. That type of translation can be easily done with virtualization. Another advantage with virtualization is we can isolate instances very easily. You can isolate the OS from the production environment and the production environment does not get compromised even if the application gets compromised. 


Virtualization is used everyday when accessing the cloud services. Even though virtualization gives more benefits, some applications give bad performance with virtualization. So, we need to be aware of that. Virtualization might not be suitable for high performance applications. These applications are having more specific high performance requirements that do not benefit much from virtualization. Virtualization is more beneficial for small to medium scale applications.


#### **Types of virtualization**


-	CPU Virtualization
-	Memory Virtualization
-	Device and I/O Virtualization
-	OS Level Virtualization
-	Network Virtualization
-	Server Virtualization
-	Client/ Desktop Virtualization
-	Application Virtualization


#### **x86 Virtualization Techniques**


How is virtualization actually achieved? When executing an application, execute the instructions running on the CPU. The instructions are executed one after the other. When we look at those instructions, some instructions need some privileges to execute because they are critical in terms of what they are accessing. 


Usually what happens is, there are two types of spaces, the user space and the kernel space where the instructions are executed. In the user space, you are allowed to run instructions without having any privileges granted to you. In the kernel space, you are given a certain amount of privileges for executing. Even in the virtual application, this is the same. 


##### **When you are virtualizing, how do you handle this process?**

The x86 architecture offers four levels of privileges known as ring 0, 1, 2 and 3. These privileges help operating systems and applications to manage the access to the computer hardware. Ring 0 has the highest level of privileges and ring 3 has least. When executing the applications, user level requests are typically running in ring 3. The operating system has direct access to the memory and hardware and the privileged instructions call the operating system. The operating system will execute them in Ring 0. That is the normal process of execution in x86 architecture.


<img src="/img/MS_4_2022_08_19.jpg" height="222.61" width="405.54"  />

If you move to the virtualization aspect, there are multiple techniques that can be enabled. You have different layers and the guest operating system. The guest operating system is an operating system running in the virtual machine environment. In application perspective, if it wants to execute privileged instructions, it will be asking the guest operating system and the guest operating system will have to figure out how to do that.

#### **Technique 1: Full Virtualization using  Binary Translation**


In this approach, the user level requests have direct access to the system hardware for high performance virtualization. If there are any privileged instructions, the user application will ask the guest operating system and it calls the hypervisor (VMM). Hypervisor translates the requests coming from the guest OS at the binary level in real time and calls the underlying hardware. 


<img src="/img/MS_5_2022_08_19.jpg" height="222.61" width="405.54"  />


The guest OS is not aware that it is being virtualized and does not have to do any modifications on it. 
The guest operating system is completely decoupled from the system hardware by the virtualization layer and can execute concurrently on the same hardware. The performance of full virtualization is not ideal because the binary translation can incur large performance overhead at run time. That performance overhead can be reduced upto some level by providing a combination mechanism of binary translation and direct execution of non critical instructions. The binary translation does a code cache to keep translated hot instructions to improve the performance. But it increases the cost of memory usage. 


##### **Technique 2 : OS Assisted Virtualization or Paravirtualization (PV)**


This is another type of technique and it modifies the OS kernel to replace non-virtualizable instructions with hypercalls. The modified guest OS with hypercalls directly calls and accesses the underlying hardware. This is known as paravirtualization. The hypervisor also provides hypercall interfaces for other critical kernel operations such as memory management, interrupt handling and time keeping. 


<img src="/img/MS_6_2022_08_19.jpg" height="222.61" width="405.54"  />


This technique helps to overcome the main issue found in full virtualization with binary translation. That reduces the binary translation cost. In full virtualization, sensitive OS calls are captured and do the binary translation. But the guest OS is unmodified and it is not aware of virtualization. In this technique, the guest kernel is modified to run with the hypervisor and enables direct communication between them. That helps to improve the efficiency and the performance within the system. The main limitation with this is we have to modify the guest OS, thus the significant support and the maintenance issues may arise in the production environment. 


#### **Technique 3: Hardware Assisted Virtualization (HVM)**


<img src="/img/MS_7_2022_08_19.jpg" height="222.61" width="405.54"  />


This technique enables efficient full virtualization using the help from hardware capabilities. The critical and the privileged instructions are set to automatically trap the hypervisor directly. A set of instructions that can be directly called by the guest OS as specific to the virtualization aspect. Intel’s virtualization technology(VT-x) and AMD’s AMD-V architectures provide special instructions set for virtualizing instances. They can call the instructions without doing any binary translation or paravirtualization in hypervisor. Hypervisor simplifies the requests and automatically forwards them into the hardware layer.  


#### **Summary comparison of the current state of x86 virtualization techniques**

|      | Full Virtualization with Binary Translation |  Hardware Assisted Virtualization    |   OS Assisted Virtualization / Paravirtualization    |
| ---  | ---                                         | ---                                      | ---                                                  |
|**Technique**| Binary translation and direct execution |Exit to root mode on privileged instructions | Hypercalls|
|**Guest Modification / Compatibility**|Unmodified guest OS. Excellent compatibility |Unmodified guest OS. Excellent compatibility|Guest OS modified to issue hypercalls. So it can’t run on native hardware or other hypervisors. Poor compatibility. Not available on windows OSes |
|**Performance**|Good|Fair Current performance lags binary translation virtualization on various workloads but will improve over time|Better in certain cases|
|**Used By**|VMware, Microsoft, Parallels|VMware, Microsoft, Parallels, Xen|VMware, Xen|
|**Guest OS Hypervisor Independent?**|yes|yes|XenLinux runs only on Xen hypervisor. VMI-Linux is hypervisor agnostic|

