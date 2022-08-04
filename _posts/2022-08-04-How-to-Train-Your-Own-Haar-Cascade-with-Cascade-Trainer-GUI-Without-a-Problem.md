---

title: How to Train Your Own Haar-Cascade with Cascade Trainer GUI Without a Problem

author: Kasun Wickramasinghe

linkedin: https://www.linkedin.com/in/kasun-sameera-wickramasinghe/

description : If you want to build your own simple object detection classifier without trouble, go through the blog post where it explains about a simple GUI for train a Haar-Cascade classifier and how to mitigate errors you will face when you do so.


---
___

### **What is Haar-Cascade Classifier?**

Haar-cascade is a machine learning object detection method that can use to identify objects in a video or an image. There are four major steps in this algorithm. Those are,

1. Haar-Feature selection.
2. Creating integral images.
3. Adaboost training.
4. Cascading classifiers.

In order to train a haar-cascade classifier, it is needed a lot of positive images which contain the object that going to detect and Negative images that do not contain an object that going to detect. For better understanding, take face detection as an example. Positive images are the images with faces negative images are the images that don’t have faces in it.

### **What is Cascade Trainer GUI**

Cascade Trainer GUI is a program which simplifies the training process of the cascade classifiers.
Not only training but also testing and improving can also be easily done with this program.  

https://amin-ahmadi.com/cascade-trainer-gui/

By visiting to above you can download the software and, in this site, all the instructions needed has provided.

### **Training Phase**


Since the above site has described every aspect of how the software should use, I'm not going to tell you to step by step how you can train a cascade classifier. Instead of that, I'm going to mention a few problems that can occur and how you can resolve them. 


The first problem you may face is if you create your negative and positive folders in a partition other than C (where OS is located.), the program will be unable to locate the even though you provide the paths of the folders to the program correctly. it will appear like it has taken the locations correctly and you will be able to start the process as well but within a few seconds process will be stopped with an error. Therefore, always make sure to create positive and negative folders inside the C partition. 


The second problem you may face is after training started after some time process will be stoped with an error saying,
     
     
`
OpenCV Error : Bad argument(Can not get new positive sample.The most possible reason is insufficient count of samples in given vec - file.) in CvCascadeImageReader::PosReader::get, file \path_to_opencv\apps\traincascade\imagestorage.cpp, line X
`


As you can see it states can not get positive samples because of the insufficient number of samples. but this happens because of different reasons. Below link provides a solution and description about this error. 

https://amin-ahmadi.com/2017/07/26/how-to-get-past-the-infamous-insufficient-count-of-samples-error-in-opencv-cascade-training/

Anyhow if you try above solution mentioned in the above link it will waste your time hugely and you will definitely fell to smash your computer in pieces because to check whether you applied solution is correct you may have to wait until training process stuck and give the error. this may take even 2 hours or a day in the process. Because of that, I suggest you put 80 as Positive Image usage so that in one single shot without a burden you can fix this error.

<img src="/img/kw_1_2022_08_05.png" />
 

As you can see in the above picture set the value to 80.

These are the usual errors that can occur. To improve the accuracy of your classifier,

- make sure that your positive images only consist of the object that needs to be detected. As well as make sure there is only one object in those images if you want to detect your objects separately with small occlusions.
- when selecting negative images make sure to select negative images that are relevant to the object you are going to detect. for example, if you are going to detect pedestrians try to use negative images of the road scenarios. 
- As well as make sure that, there are no objects that you are going to detect is included in your negative image.
- make sure to input correct aspect ratio to the program as per the instructions.     


With the help of these, I hope that you will be able to train a better Haar-Cascade classifier without a problem using Cascade Trainer GUI program. Hope this will help you. 😊😍

