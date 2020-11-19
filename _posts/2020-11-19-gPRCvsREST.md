---

title: gPRC vs REST

author: Hirunika Karunathilaka

linkedin: https://www.linkedin.com/in/hirsk/

description : Even though REST is the most preferred architecture for today&#39;s web applications, it is always better to compare with other technologies and find the best approach that suits your application. This article provides a high-level comparison between the REST architecture and gRPC

---
**gRPC vs REST**

Even though REST is the most preferred architecture for today&#39;s web applications, it is always better to compare with other technologies and find the best approach that suits your application. This article provides a high-level comparison between the REST architecture and gRPC.

Before jumping into gRPC, let&#39;s have a quick overview of what is REST and RPC protocol.

**REST Architecture in a nutshell**

- REST stands for **RE** presentational **S** tate **T** ransfer and is an architectural pattern that uses HTTP protocol.
- REST is widely used for client and server communication in web applications.
- With REST, the client can access the backend data via simple representations like JSON or XML.
- Resources are accessed by HTTP methods such as GET, POST, DELETE, PUT, etc.

Below are the architectural constraints, that needs to follow to make a system RESTful,

- _Client-server architecture_: The client and the server must be independent of each other, and the client should only know the URIs to the resource it needs to communicate with.
- _Statelessness:_ The server must not store information related to the client&#39;s request. It is the client&#39;s responsibility to maintain the state of the application.
- _Cacheable_: As on the World Wide Web, clients and intermediaries can cache the responses.
- _Layered system _
- _Uniform interface _
- _Code on demand (optional)_

**RPC Architecture in a nutshell**

- RPC stands for Remote Procedure Call.
- A protocol that one program uses to request a service from a program that is located in another computer on a network. And the requester does not need to have an understanding of the network&#39;s details.
- Uses the client-server model.
- Defines methods in an API interface and these methods are accessed remotely with their parameters and return types.

**What is gRPC?**

gRPC is an RPC platform developed by Google made open source in late Feb 2015. The &#39;g&#39; in gRPC stands for different namings. In some sources, it is attributed to &#39;Google&#39; as it is initiated by Google and also considered as a recursive acronym which means gRPC Remote Procedure Call.

However, gRPC is considered as one of the best of breeds of RPC platforms that have a high-performance communication between client and server. The concept behind gRPC is mostly similar to the basic RPC protocol, which is defining a service, then specifying the methods that can be called remotely with their parameters and return types. The client also provides these same methods in its stub which makes feel like calling a method as if it were a local object. The same methods are implemented on the server-side and a gRPC server is run to handle the client calls.

<img src="/img/hk_11_2020_08.jpg" height="380" width="650" />

PC: [https://grpc.io/](https://grpc.io/)

**How gRPC differs from REST?**

1. **Format of payload (Protocol buffers vs JSON)**

The biggest difference between gRPC and REST is the format of data (payload) that is used to communicate. For most of the restful systems, typically JSON is the payload format used by REST.

On the other hand, gRPC is using an efficient, lightweight packed format which is known as &quot;[**Protocol buffers**](https://developers.google.com/protocol-buffers/)&quot;. However, gRPC also can be used with other data formats such as JSON.

Google protobufs is used for serializing the structured data. Protobuffer is smaller, simpler, faster, and language-neutral and thus gives a plus point for gRPC.

2. **Transfer protocols (HTTP2 vs HTTP1.1)**

Another big difference is that REST heavily depends on the HTTP1.1 protocol, while gRPC uses HTTP2 new protocol which comes with some good advantages.

One of the disadvantages causes by HTTP1.1 is the latency issue. This means a TCP handshake is required for each individual request, which then costs a significant amount of time to load a page when there are multiple requests to be made.

This problem has been addressed by the HTTP2 protocol by introducing the multiplexed streams in addition to the usual response-request streaming. Therefore, a single HTTP2 TCP connection can support many bidirectional streams.

The other most significant feature in HTTP2 is it transports data as binary. This is also has been one of the major reasons for the high performance of gRPC.

![](RackMultipart20201119-4-1pre824_html_237499165a11f2b9.gif)

Here are some of the benefits of gRPC,

1. Streaming flexibility — Duplex streaming allows clients and servers to stream simultaneously.
2. High performance — Google protobuf , HTTP2 protocol.
3. Can auto-generate the client codes — Using protobuf , we can easily generate the client code and server code.

**References**

1. [https://grpc.io](https://grpc.io/)
2. [https://developers.google.com/protocol-buffers/](https://developers.google.com/protocol-buffers/)
