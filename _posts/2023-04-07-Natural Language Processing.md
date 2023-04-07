---

title: Natural Language Processing.

author: Kumuthu Priyasoma.

linkedin:

description: Natural Language Processing (NLP) is a branch of computer science that is concerned with giving computers the ability to understand and interpret text and spoken words in a similar manner that humans. It is an interdisciplinary field that draws on linguistics, computer science, artificial intelligence, and machine learning to develop algorithms and techniques that enable computers to understand, interpret, and generate human language.

---
___
Natural Language Processing (NLP) is a branch of computer science that is concerned with giving computers the ability to understand and interpret text and spoken words in a similar manner that humans. It is an interdisciplinary field that draws on linguistics, computer science, artificial intelligence, and machine learning to develop algorithms and techniques that enable computers to understand, interpret, and generate human language.

#### **Introduction**

The human language contains many ambiguities, in fact, English is one of the least ambiguous languages used in modern society, but it is still proving to be rather difficult to write software to accurately interpret the meaning of text or voice data. Text-based data at least has the advantage of being written, meaning that it’s far easier for a computer to analyze and process. In the case of voice, and data things can get more complicated because now the computer must translate the audio into written text prior to even attempting to interpret the meaning. If the written text is incorrect then the system will interpret the meaning incorrectly as well. You may have experienced this if you have ever used Google Assistant, Siri, or even chatGPT. The difficulty of interpretation gets worse when dealing with languages such as Chinese, Hindi, Japanese, etc. As the number of characters in a language increase, the probability of software writing down the correct letter combinations decrease, worse still languages like Japanese have several similar sounding characters but the meaning of a word changes drastically depending on what character is used in each word.  


#### **NLP vs NLU vs NLG**

<img src="/img/kp_1_2023_04_06.jpg" height="400 px" width="600 px"  />

Both NLU and NLG are subcomponents of NLP. Though the topics themselves are distinct they come together to create a complete system that can understand, process, and respond to queries written or spoken in human language. All the techniques we’ve seen so far are related to the subject of Natural Language Understanding (NLU). NLG refers to Natural Language Generation and is the process of translating structured information into human language.
Since human languages can get so complex it can be challenging to design software that can deal with the irregularities present in human languages. Because of these complexities, developers often use several techniques to break down the human text and voice data in ways that help the computer make sense of what it’s dealing with. Some of these tasks are as follows,

**Tokenization** - This is the process of breaking down the text into individual words or tokens. This is a fundamental step in many NLP tasks as it allows the computer to understand the meaning of each word in the text.
<img src="/img/kp_1_2023_04_06.png" height="100 px" width="500 px"  />

**Part of speech tagging** – This is the process of breaking down the verbs and nouns in a sentence based on how the sentence is arranged. For instance, the word ‘make’ in “How do I make a cup of tea?” is identified as a verb whilst “make” in “What make of car is most popular” is interpreted as a noun. 
<img src="/img/kp_1_2023_04_06.png" height="300 px" width="700px" />

**Word sense Disambiguation** – This refers to the selection of, the meaning of a word with multiple meanings by analysing semantics. This enables the computer to distinguish the meaning of “make” in “Make a finance website” and “make” in “What make of car is most popular?”
<img src="/img/kp_1_2023_04_06.png" height="300 px" width="700px"  />

**Name Entity Recognition** – Helps identify names, locations etc. NER identifies “Samantha” as a person’s name and “Colombo” as a location.
<img src="/img/kp_1_2023_04_06.png" height="100 px" width="500 px"  />

**Sentiment Analysis** – This technique attempts to extract subjective traits such as sarcasm, attitudes, suspicion etc.

All the above tasks are related to Natural Language Understanding which is arguably the most difficult and important aspect of an NLP system. There’s no point in a system that can generate a well-structured and concise answer if it cannot understand the question in the first place. This is why so many techniques are used in tandem to break down a sentence to basic components, find the meaning of each component and structure the answer by combining the results to these various components.

#### **Modern-day applications of NLP-based systems.**
NLP has become increasingly important in recent years due to the proliferation of digital communication and the explosion of data generated from these communications. According to a report by Zion Market Research, the global NLP market is projected to reach $43.1 billion by 2025, with a compound annual growth rate (CAGR) of 15.3% from 2019 to 2025. This growth is being driven by the increasing demand for enhanced customer experience, growth in machine-to-machine communication, and the rise of big data analytics.
1.	Chatbots & Virtual Assistants
One of the most important applications of NLP is in the development of chatbots and virtual assistants. Chatbots are computer programs that simulate human conversation, using NLP algorithms to understand and respond to user queries. They are being increasingly used by companies to provide customer support as well as employee training.  Virtual assistants, such as Apple’s Siri, Amazon’s Alexa, and Google Assistant, are also powered by NLP algorithms that enable them to interact and respond to the user. Recently Microsoft and Google integrated ChatGPT and BERT into their web browsers to further streamline the process of Internet browsing. 
2.	Sentiment Analysis
Another application of NLP is sentiment analysis, which is the process of identifying opinions in text. Sentiment analysis is being conducted regularly by social media companies to identify user preferences and recommend content and advertisements based on those preferences. It is also being used in political campaigns to monitor public sentiment and to predict election outcomes.
3.	Healthcare
NLP is also being used in the field of healthcare to extract information from medical records, develop clinical decision support systems, and improve patient outcomes. For example, NLP algorithms can be used to extract relevant information from electronic health records (EHRs) to support clinical decision-making, to identify patients who are at risk of developing certain diseases, and to monitor patient outcomes.
4.	Language Translation
	As the name suggests this involves the translation of text or audio from one language to another. A possible future implication for this technology is the ability to translate ancient languages. Sometimes archaeologists do not have complete alphabets to work with when it comes to ancient languages. The development of a system capable of deciphering a language based on fragments of text found in artifacts is the holy grail of language translation systems.
5.	Automated Writing
	NLP systems are regularly used to automatically generate large volumes of text data, such as news articles and research papers. In the field of research, these systems can be used to generate entire reports of experiments based only on the experiment result data. This alleviates the tedium of having to stop and document all aspects of one experiment before moving on to the other. Similar systems are being used in various organizations to rapidly generate reports and keep records of the day today activities. 
NLP is a rapidly evolving field, with new techniques and algorithms being developed all the time. One of the most promising developments in recent years has been the rise of deep learning, which is a subset of machine learning that uses neural networks to model complex relationships between inputs and outputs. Deep learning has been used to develop state-of-the-art NLP models, such as Google’s BERT (Bidirectional Encoder Representations from Transformers) and OpenAI’s GPT (Generative Pre-trained Transformer).

In conclusion, Natural Language Processing is a rapidly growing field that uses various technologies to process and understand human language. These technologies are used in various applications, such as chatbots, sentiment analysis, machine translation, and speech recognition. As NLP technology continues to evolve, we can expect to see even more sophisticated applications emerge in the future.

References 
[1].	"What is Natural Language Processing?”, https://www.ibm.com/topics/natural-language-processing,  (28 March 2023).
[2].	R.Gruetzemacher, https://hbr.org/2022/04/the-power-of-natural-language-processing, ( 28 March 2023)
[3].	"Natural Language Processing. What is it and why it matters”, https://www.sas.com/en_us/insights/analytics/what-is-natural-language-processing-nlp.html,  (28 March 2023)
[4].	"A Complete Guide to Natural Language Processing”, https://www.deeplearning.ai/resources/natural-language-processing/, (29 March 2023)
[5].	"Natural Language Processing Overview”, https://www.geeksforgeeks.org/natural-language-processing-overview/, (29 March 2023)



