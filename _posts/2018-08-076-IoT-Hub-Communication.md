---
title: IoT Hub Communication
author: Tharindu Subasith
linkedin: https://www.linkedin.com/in/amilaariyarathna/
description : IoT Hub, Azure, IoT communication
---

**IoT Hub communication**

Internet of things (IoT) has become one of the most vital and useful technologies today. This technology is widely used in transportation, agriculture, healthcare, retail and energy industries. So, today IoT is used from your house electricity meter to MRI scanner in the hospital. With the evolvement of this technology many cloud solution providers like Amazon, Google and Azure started to provide the support for the IoT platform. Today I am going to give you an idea about how Azure IoT Hub provides the communication between the cloud and the device.

**Communication protocols**

Let’s start with the communication protocols available for the communication between devices and the IoT Hub. IoT Hub supports three major protocols for the communication with devices.

* MQTT - MQTT is a client server publish-subscribe messaging transport protocol. This protocol runs over TCP/IP or other network protocols which supports ordered, lossless, bidirectional connections.

* AMQP – Advanced Messaging Queuing Protocol is an open internet protocol which consist of several layers.

* HTTPS – HTTP on secured channel.

Each of the above protocols need specific port to be open for their communication. MQTT needs port 8883, AMQP needs port 5671 and HTTPS needs port 443. If the device cannot provide the specific port for MQTT and AMQP protocols due to the limitations of the device, those protocols can be run over WebSocket on port 443.

<table>
  <tr>
    <td>Protocol</td>
    <td>Port</td>
  </tr>
  <tr>
    <td>MQTT</td>
    <td>8883</td>
  </tr>
  <tr>
    <td>MQTT over WebSocket</td>
    <td>443</td>
  </tr>
  <tr>
    <td>AMQP</td>
    <td>5671</td>
  </tr>
  <tr>
    <td>AMQP over WebSocket</td>
    <td>443</td>
  </tr>
  <tr>
    <td>HTTPS</td>
    <td>443</td>
  </tr>
</table>


*Table 1 Ports required by the protocol*

If you feel none of the above mentioned protocols are suitable for your business case, you can write your own protocol to communicate with the IoT Hub using the Azure IoT protocol gateway. For more details on custom protocols and their implementation refer the IoT Hub documentation on [Support additional protocols for IoT Hub](https://docs.microsoft.com/en-us/azure/iot-hub/iot-hub-protocol-gateway).

**Bidirectional communication**

Let’s move into the cool bidirectional communication feature of the IoT Hub. Azure IoT Hub supports both device to cloud communication and cloud to device communication.

**_Device to cloud communication_**

This feature supports the most common usage of IoT which is to collect data from millions of devices. IoT Hub maintains per device end points for each registered device to send data to the IoT Hub. There are three available options to do device to cloud communication.

* Device to cloud messages 

* Device twin’s reported properties

* File uploads

Device to cloud messages option is to send most frequent data. It supports a message payload up to 256KB and the option is available on all the three protocols.

Device twin’s reported properties option is to send less frequent and the conditions of the device such as whether it uses the electricity from the line or runs on the battery power. It supports a property size of 8KB and only available on MQTT and AMQP protocols.

File uploads is used for sending a batch of frequent data. This option can be used to send a file of telemetric data. The option is useful to reduce the network bandwidth usage when the data is not really needed at real time. Also, it can be used as back up option to ensure all the telemetric data is available in the cloud. The maximum size of a file is the file size supported by Azure Blob Storage and this option is available in all the protocols.

**_Cloud to device communication_**

IoT Hub provides the support of cloud to device communication to control the properties, states of the device or provide additional information to the device. This feature also has three options as following.

* Direct methods

* Twin’s desired properties

* Cloud to device messages 

Direct methods option is to make the commands which require immediate confirmation like turning on a light bulb in the device. This option provides the support of sending immediate response of the request. Using this option, the solution backend can target single or multiple devices at a time. This option is only available on MQTT and AMQP protocols.  

Twin’s desired properties options is to send long running commands that put the device in certain desired state. Using this option, the properties of devices which set on the cloud can be synced to the devices at real time. Property changed notification is send to the device at real time if the device is connected or it will be sent at first reconnect. Therefore, it ensures the durability of the property change. This option can target single or multiple devices at a time and available on MQTT and AMQP protocols.

Cloud to device messages option is to send one-way notifications to the device. It can only target single device at a time. It is available on all three protocols. Cloud to device messages are stored in a queue allocated to the device until the message received by the device and complete the message state. The size of this per device queue is 50 and due to that there can be at most 50 messages in the queue for a device. If you try to send more than 50 messages at a time it will result in an error.

**IoT Hub endpoints**

To have a clear idea about the communication between device and cloud you need to know about the IoT Hub endpoints. The following diagram gives an idea about the endpoints available in IoT Hub.

<img src="/img/tharindu_s.png" height="600" width="600" />

Source: [https://docs.microsoft.com/en-us/azure/iot-hub/media/iot-hub-devguide-endpoints/endpoints.png](https://docs.microsoft.com/en-us/azure/iot-hub/media/iot-hub-devguide-endpoints/endpoints.png)

As on the diagram there are per device end points to communicate with the device and service endpoints to communicate with the backend application.

Let’s look at how some communications happen with the endpoints.

*Device to cloud messages*

Device sends message to the "Send device-to-cloud" per device endpoint then then the backend application can get the message from the Azure Event Hub compatible “Receive device-to-cloud messages” service endpoint.

*Cloud to device messages*

Backend application sends messages to "Send cloud-to-device messages" service endpoint and the IoT Hub puts it on the device queue. The device keeps listening to the “Receive cloud-to-device messages” per device endpoint and after receiving the message it sets the state of the message (whether it is completed, rejected or abandoned). The solution backend can listen to the “receive delivery acknowledgments” service endpoint and check the state of the messages.

Note: - All the service endpoints except the direct method invocation endpoints are only exposed using AMQP protocol. The direct method invocation endpoint is exposed using HTTPS.

References:- 

[http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/mqtt-v3.1.1.pdf](http://docs.oasis-open.org/mqtt/mqtt/v3.1.1/mqtt-v3.1.1.pdf)

[http://docs.oasis-open.org/amqp/core/v1.0/os/amqp-core-complete-v1.0-os.pdf](http://docs.oasis-open.org/amqp/core/v1.0/os/amqp-core-complete-v1.0-os.pdf)

[https://docs.microsoft.com/en-us/azure/iot-hub/](https://docs.microsoft.com/en-us/azure/iot-hub/)

