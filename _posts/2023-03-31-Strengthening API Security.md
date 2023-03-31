---

title: Strengthening API Security.

author: Shamal Weerasooriya.

linkedin: https://www.linkedin.com/in/shamal-weerasooriya/

description: APIs have become a fundamental building block of modern web and mobile applications, and they play a critical role in enabling data exchange and integration between different applications and systems. However, they create potential entry points for cyber-attacks. Therefore, securing APIs has become vital to pursue confidentiality, integrity, and availability of the data that rely on them.

---
___

<img src="/img/sw_1_2023_02_31.jpg" height="366 px" width="436 px"  />

APIs have become a fundamental building block of modern web and mobile applications, and they play a critical role in enabling data exchange and integration between different applications and systems. However, they create potential entry points for cyber-attacks. Therefore, securing APIs has become vital to pursue confidentiality, integrity, and availability of the data that rely on them.

#### **Defense-in-Depth**

Over time humans have adopted various defense systems to protect themselves from harm. Such strategies could be employed within the field of network security as well. Defense-in-Depth is one such multi-layered defense strategy. It can be roughly grouped into three major layers.

1.	Securing the perimeters.
2.	Spotting the infiltrators.
3.	Restricting the lateral movement.


##### **1.Securing the perimeters**
Securing the perimeter is a fundamental defense strategy that most companies use to protect their network infrastructure. This defense includes tools like WAF (Web Application Firewall)s that use regular expressions and IP denylists to defend against known attack methods and vulnerabilities. Bots are a common threat used to carry out "credential stuffing" (buy leaked login credentials and try to log into web apps in batches) attacks, and the best way to defend against them is by intercepting all requests made by the bot. A defense tool can be deployed between the server and client, which inserts JavaScript into the response page to calculate the token and judge whether the other party is malicious. In an enterprise server-side architecture, various tools like WAF, SSL gateway, traffic gateway, and API gateway are all connected in series and can be used together to block most indiscriminate attacks.

##### **2.Spotting the infiltrators**
It is more dangerous to not identify any security issues in your APIs rather than find one. Therefore, it is crucial to have mechanisms in place to detect security risks. The most common observability implementations are as follows.

 - Honey pots - A decoy system that is created to attract attackers and gather information about their methods, tactics, and tools. The goal is to lure attackers into the honeypot, where they can be studied and monitored without posing a real threat to the actual system or network.
 - Intrusion Detection Systems - Monitor network traffic for suspicious behavior and can detect attacks that may be missed by other security mechanisms such as firewalls.
 - Advanced Persistent Threat Detection - Monitoring network and system activity to identify potential APT attacks and taking action to prevent or mitigate their impact on the system.

Threat intelligence is also in use now, but some imperfections might lead to false reports. Therefore, keeping logs (including when attacked, which servers were accessed, and what data has been exfiltrated) and analysis, behavior tracking, and digital evidence is sufficient for the timely detection of abnormal behaviors. 

Ex: Apache APISIX

##### **3.Restricting the lateral movement**
If an attacker breaks through the first two layers of defense, next up in the defensive line are authentication and access control. It needs to add more complexity to the system so that the attacker who’s in the intranet won’t be able to do any lateral movement.

Enforcing strong password policies such as complexity, periodic changes, and two-factor authentication for critical systems are some simple measures to avoid lateral movement rather than using SSO. The API gateway should come into action to withhold any attacks here. It can provide the following key auth features to enforce API security.

 - Ensure secure transmission of data through TLS and mTLS encryption.
 - Automatic rotation of keys
 - JWTs
 - Multiple authentication systems like OKTA and Auth 2.0

But Defense-in-Depth is not just putting up multi-layered security products. It’s a method of designing an infrastructure resistant to failures, throwing new obstacles at the attackers at each entry point. The fact that the above three layers are often maintained by three separate departments leads to cooperation between them. So, API security needed further efficient enhancement.

#### **Zero Trust**
The idea behind the zero-trust policy is that you require more authentication than just a username and password. The basic idea is there is no trusted client. Any device that is not connected to the company network is essentially considered to be harmful, whereas any device that is connected to it is not. 

Google applies this strategy themselves. Whenever a user logs into his account from a separate device, he needs to grant access from a trusted device he’s already logged in to. Some other practices of zero trust are,
 - Require re-authentication for any "high-risk" actions or transactions.
 - Implement strong multi-factor authentication methods such as the TOTP app, hardware token, or push notifications, and avoid using SMS for MFA.
 - Do not allow remember me to auto-login (remembering username and that the device is known good, skipping password and other credentials: bad)
 - Require MFA for every login attempt.
 - Completely disallow login on unknown/unrecognized devices without authenticated confirmation from a trusted device.
 - Auto-disconnect inactive sessions after a specified period.
 - Require regular (usually every couple of hours) re-authentication even in case of continuous use.

Basically, we need to focus on two main components - Identity and access management, integrating security on API gateways. It can become complex as the enterprise gets larger because there can be numerous APIs and microservices. It needs higher cost and effort to implement a zero-trust system. This doesn’t mean the system is fully protected from attackers, but we can greatly reduce the attacking radius.

In conclusion, defense in depth and zero trust are two important security concepts that can help organizations protect their valuable assets from cyber threats. Defense in depth emphasizes the use of multiple layers of security controls. Zero trust, on the other hand, takes a more proactive approach by assuming that all devices, users, and traffic are untrusted and require continuous authentication and verification before granting access.

By adopting a layered approach that incorporates defense in depth and zero trust principles, organizations can better protect their APIs against a wide range of threats, including attacks targeting vulnerabilities in the API itself, as well as attacks on the underlying infrastructure. As the use of APIs continues to grow, it's crucial for organizations to prioritize API security and adopt a proactive, layered approach to protect their valuable assets and ensure business continuity.


