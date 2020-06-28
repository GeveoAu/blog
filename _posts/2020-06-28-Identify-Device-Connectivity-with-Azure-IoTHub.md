\---

title: Identify Device Connectivity with Azure IoTHub

author: Tharindu Subashith

linkedin: https://www.linkedin.com/in/tdiluksha/

description : Azure, IoTHub

\---

Want to know the connectivity status of your IoT device? Do you want to show
your IoT devices’ connectivity status in a real-time dashboard? Okay, let’s talk
about this to come up with a good solution.

When talking about the IoT device connectivity, the first thing that comes to
mind is the heartbeat. Yes, you can come up with your implementation to send
“I’m alive” messages from the device and identify the device connectivity status
from your backend services. Yes, it is simple, but it will eat up your message
quota in IoT Hub. Again, someone can implement that more efficiently by sending
heartbeat messages only when there are no telemetry messages. That is one way to
achieve the solution, but it will also end up eating some of the daily quotas of
the IoT Hub. So, what is the best way to identify the device connectivity status
without affecting the IoT Hub quota? Let’s look into that.

\#\#\#\# IoT Hub Events

IoT Hub Events infrastructure is the simplest solution for our problem. What is
this “IoT Hub Events” solution? Azure IoT hub integrates with Azure Event Grid
so that other applications can listen to the IoT Hub events. Azure Event Grid is
an event routing service that uses the publish-subscribe model. Event Grid has
the support for routing events to many Azure Services like Azure Functions,
Azure Service Bus, Azure Logic Apps, and also to non-Azure services using
webhooks. So, this can be used to send IoT Hub related events to any third-party
service. Azure IoT Hub supports 5 event types as following.

• Microsoft.Devices.DeviceCreatedPublished

• Microsoft.Devices.DeviceDeletedPublished

• Microsoft.Devices.DeviceConnected

• Microsoft.Devices.DeviceDisconnected

• Microsoft.Devices.DeviceTelemetry

As you can see IoT Hub events support both “Device Connected” and “Device
Disconnected” events. So, let's see how we can use this infrastructure to
identify device connectivity.

\#\#\#\# Using IoT Hub Events for identifying device connectivity

IoT Hub events feature is accessible via the “Events” section in the IoT Hub.

\<img src="/img/TharinduS_1.png" width="600" height="300" /\>

You can start by adding a new event subscription and naming it with a suitable
name. Then you must select the schema of the events under the “Event Schema”
section. You can just use the default option which is “Event Grid Schema”.

\<img src="/img/TharinduS_2.png" width="600" height="300" /\>

Then you should select the event types. Select both “Device Connected” and
“Device Disconnected” events.

\<img src="/img/TharinduS_3.png" width="600" height="300" /\>

Finally, you should select the endpoint which you are going to route the events.
First, you have to select the type of endpoint then select the actual endpoint.
For example, the type of endpoint is Service Bus Queue and the actual endpoint
is the actual queue name.

\<img src="/img/TharinduS_4.png" width="600" height="300" /\>

In addition to the above, you can configure some additional features such as the
retry policy, dead-lettering on “Additional Feature”.

Now you have configured the IoT Hub to route device connectivity events to your
selected endpoint. You can use that endpoint to identify the device
connectivity.

Here are the sample outputs of “Device Connected” and “Disconnected” events when
the Service Bus Queue is used as the endpoint. The type of event is associated
with the “eventType” field and the device id can be found on the subject field
and in the data field.

\<img src="/img/TharinduS_5.png" width="600" height="300" /\>

\<img src="/img/TharinduS_6.png" width="600" height="300" /\>

This is the simplest way to identify the device connectivity states, rather than
implementing a heartbeat mechanism.
