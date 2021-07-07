---

title: Sashimono - Designing a multi-tenant dApp hosting platform

author: Ravin Perera

linkedin: https://www.linkedin.com/in/ravin-perera-61b4662b/

description : For one of our long-term customers, the LexAutomagica project Hot Pocket/Sashimono, we had to come up with a secure design for multi-tenant dApp deployments on a network of hosting nodes. The basic premise of Sashimono is to provide the ability for anyone to submit a dApp (Hot Pocket smart contract) to a shared Linux hosting environment and have their dApp instance run without interfering with other dApp instances that may run on the same host.

---

**Sashimono - Designing a multi-tenant dApp hosting platform**

For one of our long-term customers, the LexAutomagica project Hot Pocket/Sashimono, we had to come up with a secure design for multi-tenant dApp deployments on a network of hosting nodes. The basic premise of Sashimono is to provide the ability for anyone to submit a dApp (Hot Pocket smart contract) to a shared Linux hosting environment and have their dApp instance run without interfering with other dApp instances that may run on the same host. This essentially makes Sashimono a multi-tenant cloud hosting environment specialized in Hot Pocket smart contracts deployment. This article explains our thinking process as we converged on a containerization approach while also using Linux operating system security features.


**Key design goals**

1.	dApps must not interfere with the host.
1.	dApps must not interfere with each other.
1.	dApps must be subjected to constraints enforced by Sashimono platform.


### **Anatomy of a dApp instance**

In the Sashimono environment, a dApp is a Hot Pocket smart contract. Sashimono packages the Hot Pocket and smart contract executables into a container image and runs them with the help of a container manager (eg. [Containerd](https://containerd.io/))

<img src="/img/rp_1_2021_07_07.png"/>

The dApp (red box) essentially contains untrusted code. Bundling the dApp and dependencies into a container helps protect rest of the system from malicious dApps.

##### **State filesystem**

Hot Pocket uses a [FUSE](https://en.wikipedia.org/wiki/Filesystem_in_Userspace) filesystem layer to manage smart contract state. This requires access to the native FUSE device on the host thereby forcing us to run the container in “privileged” mode.

<img src="/img/rp_2_2021_07_07.png"/>

Privileged containers are a security risk. A malicious dApp will be able to perform harmful operations via the privileged container interface. Therefore, we solve this problem by moving the state filesystem out of the container as shown below.

<img src="/img/rp_3_2021_07_07.png"/>

Since the state filesystem is outside the container, container privileged mode can now be removed, and the state filesystem can directly access the FUSE device on the host.

##### **Hot Pocket vs dApp**

Within the container, Hot Pocket and the dApp is running at the same capability level. This means a malicious dApp may be able to affect the execution of Hot Pocket and generally perform operations that it is otherwise not intended to do. We solve this by having dApp execute under an unprivileged user account within the container as depicted in the following diagram.

<img src="/img/rp_4_2021_07_07.png"/>

Since the dApp is executing under a least-privileged user account within the container, it cannot affect Hot Pocket execution or perform anything outside its user permission boundary.

At this point we have 2 barriers to defend against a malicious dApp. To perform an attack on the host system, the dApp must break out of its unprivileged user account inside the container, and then also break out of the unprivileged container itself.


### **Multi-tenant instance/container management**

We just went through the anatomy of a single dApp. Now let us see how multiple such dApps may run on the same host.

<img src="/img/rp_5_2021_07_07.png"/>

##### **Sashimono – Container daemon separation**

In the above setup multiple dApp instances may run as containers managed by a container daemon. In this setup, if a malicious dApp were to break out of the container barriers, it will be able to affect the operation of Sashimono agent itself, because the container daemon and Sashimono agent are running in the same privilege level (root). We solve this by moving all container management activities to its own unprivileged user account as follows.

<img src="/img/rp_6_2021_07_07.png"/>

Since all dApp containers and the container daemon are running under an unprivileged user account, they cannot affect Sashimono or the host itself.

##### **Multi-tenant separation**

A weakness of the above setup is even though all dApps are isolated from the critical components of the system, they can still interfere with each other. A malicious dApp which breaks the container defenses will be able to compromise ALL the other dApp instances (tenants) running on the same host. Therefore, we allocate dedicated Linux user account for each dApp tenant.

<img src="/img/rp_7_2021_07_07.png"/>

With this setup, each dApp and its container management environment gets its own unprivileged user account, significantly increasing per-tenant isolation and system security.

### **Pros and Cons**

The final multi-tenant separation design shown above has some added pros and cons to it.

**Pros**
-	Protection of 3 barriers to prevent malicious code breaking out.
-	Able to rely on strong user account security provided by the Linux operating system.
-	Able to restrict resource allocation (CPU, RAM, Disk space) with Linux user quotas.
-	Clean creation and destruction of tenants.

**Cons**
-	Per-tenant container daemon overhead.
-	Cannot share common container images among tenants. Need to duplicate.
-	Container management upgrades need to be performed per-tenant basis.

So far, the security benefits delivered by this design outweigh the drawbacks. It is yet to be seen how this will evolve as we materialize our larger vision for Sashimono. Hopefully, this will be a good starting point for our future work.


### **Sashimono network**

The intention of Sashimono is to work in conjunction with a decentralized message board to listen to dApp instantiation requests and provision the instances on the host. Developers can deploy instances of their dApps on different hosts and form virtual dApp clusters as shown below.

<img src="/img/rp_8_2021_07_07.png"/>





