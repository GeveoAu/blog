---

title: Shippit And The Logistics of Online Delivery

author: Amila Lakshitha Ariyarathna

linkedin: https://www.linkedin.com/in/amilaariyarathna/

description : As the Covid19 pandemic unfolded throughout the world, many industries/businesses were adversely affected. One segment that fared differently was the ‘Online Retail/Ecommerce’ industry which saw a boom in business worldwide. There are many studies that suggest the growing trend of online shopping is going to stay even when the pandemic is over.

---

**Shippit And The Logistics of Online Delivery**

As the Covid19 pandemic unfolded throughout the world, many industries/businesses were adversely affected. One segment that fared differently was the ‘Online Retail/Ecommerce’ industry which saw a boom in business worldwide. There are many studies that suggest the growing trend of online shopping is going to stay even when the pandemic is over.

I happen to be working on a platform which caters for the logistics side of the ecommerce industry and have experienced first hand the boom in business and the good and bad it has presented.

As Sri Lanka is a small country we do not have a lot of courier services. However, when you think of a country like Australia, there are a huge number of courier services that cater for different requirements; inter-state delivery, intra-state delivery, international, express services etc… If you are an online retailer (big or small), there are so many couriers to choose from and it might be the case that for different scenarios going with the same or a few couriers
might not be ideal both financially or time wise.

For example, assume there are 2 deliveries that you want to ship where one should be delivered the same day and the other it’s not really urgent. So you would need to choose an express delivery service for the first even if it could cost you more but you can go with a cheaper standard delivery service for the latter. However, since you are just a single merchant, it’s not easy to integrate with many couriers yourself. That is because,

1. Most couriers have online systems where you would need to either have your own
system or a 3rd party system to integrate with, which costs money on maintenance
and resourcing
1. The rates provided by courier companies would not be the cheapest if you are a
small business

This is where Shippit comes in. Shippit provides a platform where you are able to make use of couriers of different sizes and flavours for a small subscription fee (or a pay as you go model where Shippit charges a small margin from each order). Since shippit has a big merchant potential, it can get better deals from courier companies in terms of ‘rates’ which in
turn reduces your delivery costs.

Now that you understand the business case for Shippit, we can look at the process of a parcel being shipped from a merchant to an end user (shopper). But before going into details, we need to cover some basic concepts.

### **Parcel**

Represents a physical item that is being sent between 2 locations. This can be something small like a pencil or something as large as a furniture item.

### **Order (Consignment)**

An order contains 1 or more parcels that are being shipped between the same locations. For example, assume you as a shopper ordered a suite. Now the merchant would create an order from his warehouse to your house to send the items in the suite (jacket, trousers, shoes etc). So these items might be packed as separate parcels and added into the order. It’s also worth noting that though they are in a single order, it does not mean all these parcels will be delivered together. But for smaller items it would be the case generally.

### **Quote**

Quotes are generated from potential couriers for an order and depending on the requirement, the cheapest or the quote with the fastest delivery would be chosen. A quote generally contains the courier price, other surcharges, estimated delivery time frame, an associated service code (a single courier can provide multiple services), etc.

### **Label**

Each parcel has an accompanying label to describe basic information about the parcel being shipped. This has both human readable content as well as barcodes/qr codes.

### **Label Number, Courier Job Id (Consignment Number)**

Each order and parcel gets a unique identifier (could be universally unique or just within the courier system). An order has a courier job id (consignment number) and a parcel has a label number.

The formats differ based on the courier and these values are usually printed in the physical label as barcodes/qr codes for easy scanning at warehouses/transits.

### **Manifest**

Manifesting is the process of sending order data stored within Shippit (or any similar platform) into the courier’s system. A manifest can contain multiple orders allocated to the same courier from the same merchant account. A manifest contains information about it’s orders such as the consignment numbers, pickup/delivery locations, parcel level information
etc which also differ per courier.

### **Resell/BYO**

As mentioned above, Shippit is generally able to secure good deals with couriers which results in cheaper rates when it comes to courier charges. These are called ‘Resell’ rates and merchants are able to make use of them to get better courier quotes for their shipments.

However, there are enterprise businesses/retails chains that already have struk deals with courier companies to get better rates and they are provided the opportunity to bring in their own rate when they integrate into Shippit. These are called BYO (bring your own) rates.

Now that we have covered some basic entities, we can look at how an order flows through Shippit and then into the courier system.

<img src="/img/aa_1_2021_03_12.PNG"/>

1. An order is created in Shippit with single or multiple parcels. The dimensions, weight, addresses, special features such as authority to leave, dangerous goods are also provided during order creation.

1. Pickup and destination addresses are validated to make sure they are valid addresses and can be serviced.

1. From the available couriers, potential couriers are selected based on merchant configurations and specific order information such as;

    - Enabled couriers for the merchant
    - Requested courier service type such as standard, express, priority etc.
    - Specific courier allocation requested during order creation
    - Other order features such as Dangerous goods shipment, white glove
    - International or domestic delivery
    
    Once the set of potential couriers are selected, quoting is done against them and a courier is allocated to the order based on cheapest or fastest delivery estimates. Depending on the merchant/courier configurations, resell or BYO rates will be used for quoting.
    
1. Once a courier is allocated, the labels are generated for the parcels in the order. Depending on the courier and order, other supplementary documents such as customs invoices, dangerous goods declaration etc are also generated at this stage.

    Once the labels are generated, the merchant downloads and prints the labels and sticks them into the respective parcels. The label (and other document) formats, content differs from courier to courier.
    
1. Next step is manifesting (also called booking). This is where the order information contained in Shippit is passed to the courier system electronically. Multiple orders can be manifested at once and the Shippit workflow has been designed to make it easier for merchants to create and label orders throughout the day and manifest them once.

    This step also generates another document called manifest document which lists down all the orders bundled into the manifest. This is used by the courier drivers during pickup to match up against the actual items they pick up.
    
1. Pickup request is sent to the courier after the manifesting. Now this step is not needed for some couriers and merchant configurations. For example, some couriers incorporate the pickup request into the manifest step itself while in other cases, big merchants like large retail shops etc have daily/hourly pickups already scheduled with the couriers so they do not need a separate pickup call.

    At this point, the orders are picked up by the courier and taken to it’s warehouses/transit centers and the tracking process is initiated.
    
1. Tracking process updates the orders state as it flows through the courier network to give live updates to the merchant as well as the end receiver. The Shippit track page is updated and depending on merchant configurations, live notifications (sms, email) are sent to merchant and receiver.

I’ve only provided high level details on the general workflow that is followed by many couriers. But there are couriers who deviate from the general workflow and more or less steps. Furthermore, electronic data exchange happens in multiple ways (API, FTP etc) depending on the courier support.

Below are a couple of sample labels/documents that are generated along the order workflow for your reference. I hope this brief introduction provides an overview of how an online shopping order flows through Shippit (or other similar systems) into the courier systems and finally to the receiver.

### **Provided Samples**

- [Label](https://drive.google.com/file/d/1uAjhzziGLqhGULzRuBzt0URHdsD671RG/view?usp=sharing)
- [Commercial Invoice](https://drive.google.com/file/d/1FlB98OhF6APw49h3oqEWKMgm1jRtI2AK/view?usp=sharing)
- [Manifest Document](https://drive.google.com/file/d/1ZQ1oozbntCm2MLCOS4feu4RecVnBkIrg/view?usp=sharing)
