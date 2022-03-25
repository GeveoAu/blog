---

title: Machine Learning as a Service

author: Amith Dissanayaka

linkedin: https://www.linkedin.com/in/amith1316s

description : In the fast moving world of software engineering, users expect powerful features embedded with applications. When addressing those expectations Machine Learning comes in. Let's look at how we can integrate ML into our applications with ML as a service.

---
___

In today’s fast-moving world users are expecting powerful features embedded with their applications such as adopt new features, recommendations, object detection, voice assistance, fraud detection etc. To address these feature requirements, developers are started to be relying on machine learning technologies to be embedded in their applications. But using fine-tuned machine learning, only they can deliver those powerful features to their customers. 


When it comes to implementation of Machine Learning Model, it would be highly cost as well as it takes much longer development time. Plus complexity will be high. These are the main stages of implementing a ML model. 

<img src="/img/ad_1_2022_03_25.png"/>

What happens if we don’t have Machine Learning experience? Then how can we get started?  In that case, Machine Learning as a Service will be taking the place. 

## **What is ML as a service**


Machine Learning as a service means list of services, which provides machine learning tools as a part of cloud computing services by various cloud service providers. It will be helpful for the customers to embed ML services to their applications without the cognate cost, risk and the time. Some of the complex parts for instance, data pre-processing, model training, model evaluation and predictions are handled by service providers. And developers can simply integrate ML model to the application. AWS, Google/Firebase and Azure are the leading cloud service providers, and they offer various ML services to enhance their users experience. 

#### **Most of the common services provided by cloud service providers**

-	Face Detection
-	Image Labeling
-	Object Detection and Tracking
-	Text Recognition
-	Post Detection
-	Text to Speech
-	Speech to Text
-	Translation
-	Landmark Recognition


Moreover, if we have already developed Machine Learning Model and we don’t have hosting facility yet, then we can use their hosting services to serve our model. In that case, we can simply upload the out model and that’s it. 

#### **Integrate Google ML kit to Flutter**

Flutter is current trending mobile app technology and ML kit provides easy pub.dev package to integrate the services. 

#### **Add package**

```
flutter pub add google_ml_kit  // Run this command or

dependencies:
  google_ml_kit: ^0.7.3  // Add dependency
```

#### **Import**

```
import 'package:google_ml_kit/google_ml_kit.dart';
```

#### **Usage**

**NLP Smart Reply**

```
 Future<void> _addConversation(bool localUser) async {
    if (localUser) {
      _smartReply.addConversationForLocalUser(_localUserTextController.text);
    } else {
      _smartReply.addConversationForRemoteUser(
          _remoteUserTextController.text, 'user1');
    }
  }

  Future<void> _suggestReplies() async {
    final result = await _smartReply.suggestReplies();

    setState(() {
      _suggestions = result['suggestions'];
    });
  }
```

In this example, Cloud processing will be used. Hence, no need to download model from the cloud. “_addConversation” function is used to add user’s conversations as a thread. This will be an input to suggest replies from the model. Here, used a local user and one remote user for the demonstration purpose. After adding couple of messages to both users, it’ll return some meaningful replies which user can select them or modify them. “_suggestReplies” function is used to get the suggestion list.

**Entity Extraction**

```
  final _languageModelManager = GoogleMlKit.nlp.entityModelManager();

  final _entityExtractor =
      GoogleMlKit.nlp.entityExtractor(EntityExtractorOptions.ENGLISH);

  Future<void> downloadModel() async {
    var result = await _languageModelManager
        .downloadModel(EntityExtractorOptions.ENGLISH, isWifiRequired: false);
    print('Model downloaded: $result');
  }

  Future<void> deleteModel() async {
    var result =
        await _languageModelManager.deleteModel(EntityExtractorOptions.ENGLISH);
    print('Model deleted: $result');
  }

  Future<void> getAvailableModels() async {
    var result = await _languageModelManager.getAvailableModels();
    print('Available models: $result');
  }

  Future<void> isModelDownloaded() async {
    var result = await _languageModelManager
        .isModelDownloaded(EntityExtractorOptions.ENGLISH);
    print('Model download: $result');
  }

  Future<void> translateText() async {
    var result = await _entityExtractor.extractEntities(_controller.text);
    result.forEach((element) {
      print(element.entities);
    });

    setState(() {
      data = result;
    });
  }
```

In this example, on device processing will be used and needed to download the language model from the cloud. “_languageModelManager” is an object created from GoogleMlKit and it contains several methods to download, delete, get available models and check whether model is downloaded successfully. After downloading the model, “_entityExtractor” object is used to extract entities from the given sentences. 

These are only few examples from Google ML kit. There are plenty of models already created and developers can use them for applications. 


#### **References**

-	https://developers.google.com/ml-kit
-	https://firebase.google.com/products/ml 
-	https://aws.amazon.com/free/machine-learning  
-	https://azure.microsoft.com/en-us/services/cognitive-services/#overview