---

title: Setting up Secure FTP folder access per user in an Azure Virtual Machine

author: Sandun Perera

linkedin: https://www.linkedin.com/in/sandunangelo/

description : Authentication, Azure, Cloud, FTP, Security, Virtual Machine

---

Once you logged into the VM server with an administrator account, go to Server Manager and **Add Roles**, select **Web Server (IIS)**, proceed and install.

Then go to Add Role Services, select the features **FTP Server** and sub features, install. Now the server is equipped with FTP capabilities. Let’s move on to the next step.

In order to setup FTP service, we first need to create a physical root **folder/drive** dedicated for the purpose, so go ahead and find the best drive for the job (more free space, non-OS drive, partition type, etc.)

Let’s move on to the Internet Information Services (IIS) to setup the FTP site. Though you can create multiple FTP sites, there is a catch where FTP handshake generally communicates on same port 21 unless the FTP client knowingly communicates to the port you defined. 

Right click on **Sites** node in IIS and **Add FTP site…** configure the steps as you required, select the root location identified previously, optionally you may go with SSL certificate as well for better security. Which will limit the client accessibility through an FTP client like FileZilla. **Users cannot access secure FTP from a browser or from windows explorer.**

For the authentication you may select Basic and matching configurations afterwards, as we are giving one folder access per user account. Otherwise you can go with **Anonymous** if you don’t bother when a user has access to the FTP site what are the folders, they should allow but all of them.

Since we do have a specific type of users as FTP clients, we can create a windows user group as **FTP Users.** And create few windows user accounts **with passwords** and add them to the user group. In FTP site in the IIS, go to **FTP Authorization Rules,** and **Add Allow Rule** for the user group we created.

Then go to FTP Firewall Support in the FTP Site, and give the public IP of the current server as the **External IP Address of Firewall** field.

Also try to specify **Data Channel Port Range** as 7000-7010 (as of your need), but if the field is read only, then use the below CLI command to set it.
```
C:\Windows\System32\inetsrv> appcmd set config /section:system.ftpServer/firewallSupport /lowDataChannelPort:7000 /highDataChannelPort:7010
```
In the **windows firewall,** add a new **inbound** rule to **allow ports 20, 21, 22, 7000-7010**
Restart the FTP site to reflect the configuration changes. Now the FTP site is accessible from a client, but we are not done yet. Let’s move to the last step of the setup procedure.

One user should be able to access only a specific folder for them. That will be handle by the windows folder permissions.

Go to the root folder/drive properties > **Security** tab.
Leave only the below listed user groups/users only and remove others.

 CREATOR OWNER

 SYSTEM

 Administrators (\Administrators)

**FTP Users (\FTP Users)**

While others having their default permissions, allow **permissions to FTP Users group as below, and nothing should deny.**

•         Full control – **False**

•         Modify – **False**

•         Read & Execute – **True**

•         List folder contents – **True**

•         Read – **True**

•         Write – **False**

With above permissions, clients in the FTP Users group will see the content inside the root location but they cannot do any modifications.

Now create individual folders per user account. Select each folder and go to its properties > Security tab.
Leave only the below listed user groups/users only and remove others.

•         CREATOR OWNER

•         SYSTEM

•         Administrators (\Administrators)

•         **Client 1 (\Client 1)**

While others having their default permissions, allow **permissions to Client 1 user** as below, and **nothing should deny.**

•         Full control – **False**

•         Modify – **True**

•         Read & Execute – **True**

•         List folder contents – **True**

•         Read – **True**

•         Write – **True**

Now the configurations are completed for an on premise server. Since we are talking about an Azure VM in cloud, it has a **Network Security Group** resource associated to the VM. In there also you have to allow the incoming request filtering, allowing/denying ports, etc. just like another firewall.

So **now the configurations are completed and ready to consume, but…** so far if you have used an FTP client to test in intermediate steps and if they do not reflect the final result specifically in FileZilla, it’s a kind of a caching in the tool. Just completely close the FTP client app and relaunch to check.

Happy FTP!!!

**References**

https://sandunangelo.blogspot.com/2019/07/ftp-connection-modes-active-vs-passive.html

http://www.intstrings.com/ramivemula/articles/enable-ftp-access-on-windows-azure-vm/

https://itq.nl/walkthrough-hosting-ftp-on-iis-7-5-a-windows-azure-vm-2/

https://stackoverflow.com/questions/18422391/how-to-set-up-ftp-on-azure-vm

https://docs.microsoft.com/en-us/iis/configuration/system.applicationhost/sites/site/ftpserver/security/ssl

https://www.namecheap.com/support/knowledgebase/article.aspx/9769/69/ssl-for-ftp-on-windows-servers

https://support.winhost.com/kb/a666/how-to-set-up-filezilla-to-use-ftp-over-ssl.aspx


