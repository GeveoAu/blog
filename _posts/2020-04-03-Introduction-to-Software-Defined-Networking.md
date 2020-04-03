---

title: Introduction to Software Defined Networking (SDN)

author: Kasun Amarasinghe

linkedin: https://www.linkedin.com/in/kasunprabath/

description : Networking, SDN

---

Software-Defined Networking (SDN) terminology is in the networking industry for
nearly just over a decade now and it is getting more popular every year. We can
hear stories about how the entire network systems will be dynamic and
programmable in the near future.

So what is SDN and why is it becoming popular?

To answer the above questions, we will have to take a closer look at
“traditional” networking approaches. And we will discuss the current
“limitations” of traditional networking, then explain what SDN is and how SDN is
supposed to solve the “problems” that traditional networking has.

When it comes to the SDN many people are confused with Openflow. They think
Openflow is the software-defined network. Here I hope to explain the difference
between both entities also. For a start let's start with explaining traditional
networking architecture.

**Traditional Networking**

Networking has always been very traditional. We have specific network devices
like routers, switches, and firewalls that are used for specific tasks.

<img src="/img/Kasun1.jpg" width="600" height="300" />

These network devices are sold by networking vendors like Cisco and often use
proprietary hardware. Most of these devices are primarily configured through the
CLI (Command Line Interface), although there are some GUI products like CCP
(Cisco Configuration Protocol) for the routers.

<img src="/img/Kasun2.jpg" width="600" height="500" />

When we consider a network device, for example, a router has different functions
that it has to perform. Think for a moment about some of the things that a
router has to do in order to forward an IP packet:

● It has to check the destination IP address in the routing table in order to
figure out where to forward the IP packet to.

● Routing protocols like OSPF, EIGRP or BGP are required to learn networks that
are installed in the routing table.

● It has to use ARP to figure out the destination MAC address of the next-hop or
destination and change the destination MAC address in the Ethernet frame.

● The TTL (Time to Live) in the IP packet has to be decreased by 1 and the IP
header checksum has to be recalculated.

● The Ethernet frame checksum has to be recalculated.

All these different tasks are separated by different planes. There are three
planes:

● Control plane

● Data plane

● Management plane

**Control Plane**

The function of the control plane is exchanging routing information,
constructing the ARP table, Learning MAC addresses to build a switch MAC address
table, Running routing protocols and building the routing table. Etc.. Basically
control plane defined the software installed in the router(The brain of the
network device) which tightly coupled with the hardware.

**Data Plane**

The function of the data plane is forwarding traffic listed below and It relies
on the information that the control plane supplies,

● Encapsulate and de-encapsulated packets.

● Adding or removing headers like the 802.1Q header.

● Matching MAC addresses for forwarding.

● Matching IP destinations in the routing table.

● Change source and destination addresses when using NAT.

● Dropping traffic because of access-lists.

The tasks of the data plane have to be performed as fast as possible so that it
is implemented in the hardware level using specialized hardware.

**Management Plane**

The management plane is known for the access and management of our network
devices. For example, accessing our device through telnet, SSH or the console
port.

# Software-Defined Networking (SDN)

Every organization or vendor has a different opinion about what SDN exactly is
and the different products that they offer.

Traditional networking uses a distributed model for the control plane. Which
means every network device has its own control plane. Protocols like ARP, STP,
OSPF, EIGRP, BGP, and others run separately on each network device. These
network devices communicate with each other but there is no central device that
has an overview or that controls the entire network.

With SDN, we use a central controller for the control plane which means we’re
removing the tightly coupled software from the hardware and implementing the
software separately. This separate implementation is known as the SDN
controller. The SDN controller could be a physical hardware device or a virtual
machine.

Which enables greater automation and programmability in the network. It is often
paired with network function virtualization (NFV), which separates network
functions like firewalling, Natting, Dynamic routing from hardware in the form
of virtualized network functions (VNFs).

<img src="/img/Kasun3.jpg" width="600" height="300" />

In the above image, you can see an SDN controller that is responsible for the
control plane. The switches are now just “dumb” devices that only have a data
plane (Just the hardware), no control plane. The SDN controller is responsible
for sending control signals to the data plane of these switches with information
from its control plane.

There are some advantages and disadvantages of having a distributed vs a
centralized control plane. One of the advantages of having a central controller
is that we can configure the entire network from a single device. This
controller has full access and insight into everything that is happening in our
network. So network engineers can have a birds-eye view of the network all the
time which gives more advantages in a data center level implementation.

The SDN controller uses two special interfaces as shown below,

<img src="/img/Kasun4.jpg" width="300" height="500" />

The interfaces are called the northbound interface (NBI) and the southbound
interface (SBI). Also, we can address them as APIs.

Southbound Interface

The SDN controller has to communicate with our network devices in order to
program the data plane. This is done through the southbound interface. This is
not a physical interface but a software interface, often an API (Application
Programming Interface). For the question asked at the beginning about the
Openflow, the Openflow is a southbound protocol that defines a set of rules to
how the controllers should communicate with the dump hardware devices. Openflow
is an open-source and currently under the management of the open networking
foundation.

Apart from Openflow other popular southbound interfaces are:

Cisco OpFlex: this is Cisco’s answer to OpenFlow. It’s also an open-source
protocol that has been submitted to the IETF for standardization.

CLI: Cisco offers APIC-EM which is an SDN solution for the current generation of
routers and switches. It uses protocols that are available on current generation
hardware like telnet, SSH, and SNMP.

Northbound Interface

The northbound interface is used to access the SDN controller itself. This
allows a network administrator to access the SDN controller to configure it or
to retrieve information from it. This could be done through a GUI but it also
offers an API that allows other applications access to the SDN controller. You
can use this to write scripts and automate your network administration.

● List information from all network devices in your network.

● Show the status of all physical interfaces in the network.

● Add a new VLAN on all your switches.

● Show the topology of your entire network.

● Automatically configure IP addresses, routing, and access-lists when a new
virtual machine is created.

Using the Northbound interface (API) software developers can develop various
kinds of network applications which are cannot develop under the traditional
networking approach. There are no standard Northbound API specifications
available like Southbound APIs (Openflow). It differs from the SDN controller
implementation. Also, there are multiple SDN controllers available like
OpenDaylight, NOX, POX, Floodlight, Ryu, etc.

SDN enables cloud-like computing within a network. This enables network
engineers and administrators to respond quickly to changes in business
requirements through a centralized control console that is abstracted from the
physical hardware of the network. In other words, SDN creates a centralized
brain for the network that can communicate and command the rest of the network.

Conclusion

This has given just a global understanding of what SDN is about and why the
market is looking for solutions like this. Time will tell what networking will
look like in the future. Probably dynamic, programmable and real-time. It’s more
likely we will be using APIs more often than the CLI in the future. Probably
network infrastructure development will be done by software engineers with
strong networking knowledge not by electronic engineers. At the moment we don’t
know how popular SDN will be but this scenario might be a bit similar to what
happened to analog telephony. There are a lot of telecommunication professionals
that refused to learn about VoIP because they thought analog telephony has
always worked. A few years later, they are dinosaurs in a world dominated by
VoIP.
