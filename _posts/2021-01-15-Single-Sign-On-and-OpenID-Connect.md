---

title: Single Sign-On and OpenID Connect

author: Hiran Amarasinghe

linkedin: https://www.linkedin.com/in/hiranamarasinghe/

description : With the growing number of applications, it’s impossible to remember different credentials to individual applications and that demands a centralized credentials management/authentication system. Your single google account can be used to access multiple applications such a YouTube, Gmail, Google maps etc. At the same time, we could use our social media account credentials such as Facebook and twitter to log in to millions of web/mobile applications. Hence, it’s imperative to understand how single sign on works.

---
___

<img src="/img/ha_1_2021_01_15.jpg" height="600" width="618" />

Every application requires some form of authentication to secure their domain. The most common way is to use a user name and password with additional configuration such as 2FA and Biometrics. With the growing number of applications, it’s impossible to remember different credentials to individual applications and that demands for a centralized credentials management/authentication system. For instance, your single Google account can be used to access multiple applications such a YouTube, Gmail, Google maps etc. At the same time, we could use our social media account credentials such as Facebook and Twitter to log in to millions of web/mobile applications. Hence, it’s imperative to understand how single sign-on works.

**How it works**

In simple terms, SSO involves two parties and they are as
- Authorization party
- Relying party

There could be a chain of authorization parties involved in SSO and a relying party could be an authorized party to a different relying party. We will use a simple example to understand the process and assume that this process happens for the first time.

A user requests to access a web application and the application needs to verify his identity.

- The web application is configured to redirect the user to the authorization party (login page) along with additional information to identify the web application (aka relying party). This additional information could be client id or key which could be appended in HTTP header or query string parameters. A relying party (RP) receives such identification details during RP registration process. It’s the responsibility of the web application (RP) to store these details.
- After the user is directed to the authorization party, he needs to verify his identity by providing user credentials
- If the user is a legitimate user, he will be redirected back to the original application with special identification token (Cookie or JWT token)issued by the authorization party
- The relying party can validate these tokens and the verification process could depend on the protocol.
- If the user requests to access the second web application, the web application can decide whether it should approach the authentication party as the user could already hold an identification token.


**How to implement Single Sign-On**

There are several options available to us and this article will discuss on OpenID Connect in detail.
- OpenID Connect (OIDC)
- SAML
- Light Weight Directory Access Protocol (LDAP)

OpenID Connect is simply a user identification protocol which issues Id token to identify the user. An Id token is a standard JWT token that carries information about the user. OpenID connect operates similar to OAuth 2.0 protocol except its goal is to identify the end-user (authentication).

The purpose of the OAuth2 protocol is to solve authorization issues. For instance, a third-party application needs to post messages to the logged in users Facebook friend list. In order to perform this, the third party application requires permission to access Facebook on behalf of the user. This could be easily achieved through the OAuth 2 protocol as it’s designed to provide identification for third party applications to act on behalf of the resource owner. 

The application should register itself with the service provider (Facebook, Google, etc.). When the user is redirected via the third party application to authenticate through Facebook, he needs to consent the application to access his contacts. As a result, the third-party application will receive a short living token called Access token (a type of JWT token). This token can be presented to the service provider (Facebook) whenever the third party application attempts to access Facebook. 

Access token defines a set of permissions and the third party application is strictly bounded to perform these activities. If the token is expired the user will be navigated to the service provider (Facebook) to acquire a new token or can silently renew the access token by exchanging with a refresh token. A refresh token is a special token which has a longer validity(30 days) than other tokens and this token is used to refresh id and access tokens.

**SSO applications and Sign-out**

Based on application requirements, different sign out approaches is known.
- Global sign out which will sign out the user from all relying parties
- Single sign out which requires the user to be signed out from a single application.

OIDC specification defines 3 types of Sing-outs.

- Session Management

This involves the RP (Relying Party) continuously polling Open Id Connect provider (OP) to check the login status of the user. For instance, the browser could perform a status check in every 10 seconds to decide whether the user is signed off. The advantage of this approach is that RP can clear the local session soon after it receives login status via polling. In this case, the application should not rely on the expiration time of Id or access tokens.

- Front Channel Logout

An RP registers itself with OP by providing a logout URL. This URL will be consumed by OP to generate a hidden browser iframe by setting “src” attribute to the logout URL of RP. In addition to the URL, it may or may not include additional form URL encoded parameters such as “user session id (sid)” to identify the user.

- Back Channel Logout

The logout is initiated by OP and calling the logout endpoint of each RP. When RP registers, it needs to define the logout endpoint. The following steps could be executed in this process.
- OP generates a new token called “logout token” and pass it to the logout endpoint which is hosted on the RP side
- RP validates the token and if the token is invalid returns 401
- If the token is valid it will clear all its session/local storage information related to the user
- The RP could be an OP to different RPs and in such a situation the RP which received the logout token should inform the other relying parties.

**Enterprise SSO implementations**

Enterprise applications are getting increased and there is an inevitable demand for such providers. Following are few of the providers

- Auth0
- AWS Cognito
- PING
- OneLogin

These providers are capable of managing custom user store, integration with external identity providers such as Google, Facebook, Instagram, etc. They are also capable of re-issuing homogeneous tokens to the end-user irrespective of the issuer.

**Benefits of Single Sign-on**

- Centralized credential management
- Enterprise application developers could focus on business without the worrying about the security aspect
- Availability of mature protocols such as OIDC, SAML and LDAP
- Issuing homogeneous tokens so that the end-users are free from performing various verifications


**Conclusion**

Security is a challenging aspect due to advanced vulnerabilities. Hence it is vital to consume well-known identity providers and rely on protocols such as OIDC, SAML, LDAP without re-implementing the wheel.

