---

title: An Overview of Azure Active Directory B2C 

author: Asanka Indrajith

linkedin: https://www.linkedin.com/in/asanka-indrajith-9510a025/

description : Azure Active Directory Business to Consumer (Azure AD B2C) provides identity as a service (IDaaS) for business-to-customer. Azure AD B2C is an identity management service that enables you to customize and control how your customers authenticate in your consumer facing application. Azure AD B2C is as its core a flexible, policy-based, data-driven identity exchange service that help you to orchestrates authentication.

---

**An Overview of Azure Active Directory B2C**

### **What is Azure Active Directory B2C?**

Azure Active Directory Business to Consumer (Azure AD B2C) provides identity as a service (IDaaS) for business-to-customer. Azure AD B2C is an identity management service that enables you to customize and control how your customers authenticate in your consumer facing application. Azure AD B2C is as its core a flexible, policy-based, data-driven identity exchange service that help you to orchestrates authentication.

### **Why should we use Azure Active Directory B2C?**

Because it’s

-	Highly available
-	Worldwide scaling
-	Secure 
-	Reliable

**Key benefits of Azure AD B2C**

Simple & Secure 

-	Minimal application code
-	Easy to maintain
-	Enterprise-grade security features

You can implement and manage all your Identity scenarios using AD B2C policies without writing any code on your application at all. Because of this it’s easy to manage and maintain your identity implementation.

Flexible

-	Multiple Identity Providers
-	.NET, iOS, and Android
-	Open standards (Open ID Connect, OAuth 2.0, SAML)

Azure AD support integration with any Identity provider that support any open standard protocols. Also, you can use The Microsoft Authentication Library (MSAL) to configure your applications to work with AD B2C. MSAL supports many different application architectures and platforms including .NET, JavaScript, Java, Python, Android, and iOS.

### **How Azure AD B2C is different from Azure AD?**

| Azure AD  | Azure AD B2C |
| :----:    | :----:       |
| Cloud service that allows securely sign in users with a Microsoft work or school account | More generic identity provider than standard AAD. Built for consumer-facing applications.  |
| The identity provider underneath Office 365, Azure and Dynamics 365 | Integrate multiple identity providers that support standard Protocols. (OIDC, SAML, OAuth) |
| Provides Identity and access management features | Go beyond Identity and access management and can be used for enterprise scenarios as well. |
| Single Sign-On for cloud services for azure/Office accounts. | It’s highly customizable thanks to custom policy capability |
|           |             |


#### **Azure AD is mainly for enterprise scenarios such as**

-	You are building a line of business app for your org
-	Or a SaaS app that any org with O365 should be able to use
-	Or you need to be able to access Microsoft Graph API for the organization
Azure AD B2C is mainly for consumer scenarios 
-	Any app where anyone should be able to add and use any type of account (Use any identity provider)
-	Or use local accounts
-	MFA
-	Calls other Rest APIs or Graph API
-	Get user input from User interfaces
-	And many more

### **KEY components Of Azure AD B2C tenant**

-	**Directory** - The directory is where Azure AD B2C stores your users' credentials and profile data, as well as your application registrations.

-	**Application registrations** - You register your web, mobile, and native applications with Azure AD B2C to enable identity management. Also, any APIs you want to protect with Azure AD B2C.

-	**User flows and Custom policies** – You can have built-in (user flows) and fully customizable (custom policies) identity experiences for your applications.

    - Use user flows for quick configuration and enablement of common identity tasks like sign up, sign in, and profile editing.
    
    -	Use custom policies to enable user experiences not only for the common identity tasks, but also for crafting support for complex identity workflows unique to your organization, customers, employees, partners, and citizens.
    
- 	Identity providers - Federation settings for:

    -	Local accounts that enable users to sign up and sign in with a username (or email address or other ID) and password.
    
    -	Social or External identity providers that support standard identity protocols like OAuth 2.0, OpenID Connect, and more (Facebook, Google, Microsoft, ADFS, or Salesforce).
    
-	Keys - Add and manage encryption keys for signing and validating tokens, client secrets, certificates, and passwords.

### **What is an Azure Identity User Journey (Identity User Experience)?**

It’s the path through which a policy allows a relying party application (Client app) to obtain the desired claims for a user. The user is taken through an explicit path to retrieve the claims that are to be presented to the relying party. This might involve multiple actions. In Other words, Identity user journeys define the business logic of what an end user goes through as the Azure AD B2C Identity Experience Framework processes the request. 

Example- User Authentication using External identity provider.

1.	The relying party application (Client app) initiates an authorization request to Azure AD B2C using relying party configured protocol (OIDC/SAML/OAuth).

1.	Azure AD B2C invokes the identity configured protocol (OIDC/SAML/OAuth) to communicate with that identity provider.

1.	User redirects to external identity provider sign on page.

1.	After the sign-in operation completed with the external identity provider, Azure AD B2C then returns the token to the relying party application (Client app) using relying party configured protocol (OIDC/SAML/OAuth).

<img src="/img/ai_1_2021_07_16.png"/>

In Azure AD B2C, there are two primary paths you can take to provide these identity experiences: user flows and custom policies.

-	User flows (Previously - User Policies) are predefined, built-in, UI configurable policies that can create basic sign-up, sign-in, and profile editing experiences in minutes.

-	Custom policies enable you to create your own user journeys for complex identity experience scenarios. Learning curve is steep.

Both user flows and custom policies are powered by the Identity Experience Framework, Azure AD B2C's policy orchestration engine.

### **User flows**

To set up the most common identity tasks, the Azure portal includes several predefined and configurable policies called user flows. Applications can configure provided user flow settings to control identity experience of their users.
Azure AD B2C includes several types of user flows such as Sign up and sign in, Profile editing, Password reset and you can configure following settings;

-	Account types used for sign-in, such as social accounts like a Facebook, or local accounts that use an email address and password for sign-in

-	Attributes to be collected from the consumer, such as first name, postal code, or country/region of residency

-	Azure AD Multi-Factor Authentication (MFA)

-	Customization of the user interface

-	Set of claims in a token that your application receives after the user completes the user flow

-	Session management

Most common identity scenarios for applications can be defined and implemented effectively with user flows. But if you have complex user journey scenarios or uncertainty where your login will evolve I would recommend you to use Custom policies.

### **Custom Policies**

Custom policies are configuration files (XML) that define the behavior of your Azure AD B2C tenant user experience. While user flows are predefined in the Azure AD B2C portal for the most common identity tasks, custom policies can be fully edited by an identity developer to complete many different tasks.

Custom policies are fully configurable and policy-driven. custom policies give you the ability to construct user journeys with any combination of steps. For example:

-	Federate with other identity providers
-	First- and third-party multi-factor authentication (MFA) challenges
-	Collect any user input
-	Integrate with external systems using REST API communication

Custom policies unlock access to the full power of the Identity Experience Framework (IEF) orchestration engine. With custom policies, you can leverage IEF to build almost any authentication, user registration, or profile editing experience that you can imagine.

<img src="/img/ai_2_2021_07_16.png"/>

I hope this brief introduction provides an overview of Azure AD B2C and core concepts of it.

