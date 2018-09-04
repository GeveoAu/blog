---
title: Sentiment Analysis
author: Akila Iroshan
linkedin: https://www.linkedin.com/in/akilairoshan/ 
description : Sentiment Analysis
---

Sentiment analysis is the field of study that analyzes people's opinions, sentiments, evaluations, attitudes, and emotions from written language[1]. It uses computational linguistics to determine attitudes of a source toward some target/aspect. Attitudes can be emotions such as love, hate, value, desire etc or simple weighted polarity like positive negative or neutral. 

<img src="/img/akila_0.jpg" height="400" width="600" />
<center> *source: https://s3-ap-south-1.amazonaws.com/av-blog-media/wp-content/uploads/2018/07/performing-twitter-sentiment-analysis1.jpg </center>
<br/>

Generally sentiment analysis has been investigated mainly at three levels. Which are,

**Document level**

The task at this level is to classify whole opinion of a document and express a positive or negative sentiment. For an example, given a product review, sentiment analysis system determines whether the review expresses an overall positive or negative opinion about the product.

**Sentence level**

The task at this level goes to the sentences and classifies whether each sentence expressed a positive, negative, or neutral opinion.

Classifying opinion (sentiment) texts at the document level or the sentence level is often insufficient for applications because they do not identify opinion targets or assign sentiments to such targets. For an example, in the following review a positive opinion at sentence level does not mean that the author is positive about everything. 

"Although the service is not that great, I still love this restaurant"

**Entity and Aspect level**

Task at this level goes to identify opinion (sentiment) and opinion target/aspect and classify whether each opinion expressed a positive, negative, or neutral opinion.

Entity is the target object that has been evaluated. An entity can have a set of components and a set of attributes. Each component may have its own subcomponents and so on. For an example cellular phone is an entity. It has a set of components like battery and screen, and also a set of attributes like voice quality, size, and weight. These are considered as aspects of the entity. An opinion (sentiment) can be expressed on any of those aspects.

There are two types of aspects found in customer reviews. These are,

* Explicit Aspects - correspond to the specific words in the review. For an example in mobile phone review, if "battery life" literally mentioned in a review and customer mentioned his opinion on battery life, the battery life can be consider as explicit aspect.

* Implicit Aspects: not specified aspect word or word phrase in the review but indirectly it conveys an opinion about an aspect. For an example, "This phone is inexpensive" implies that the phone’s price aspect is positive.

Aspect-based sentiment analysis process involves two major tasks. Which are,

* Aspect Extraction - In this task aspects which have been evaluated in reviews are extracted. In included extracting both explicit and implicit aspects.

* Aspect Sentiment Classification: This task determines whether the opinions on each extracted aspects are positive, negative, or neutral.

Extracting the explicit aspects is relatively easy task compared to the extracting implicit aspects.

**References**

[1]	B. Liu, Sentiment analysis and opinion mining. Morgan & Claypool Publishers, 2012.

