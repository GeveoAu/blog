---

title: Managing Project Dependencies with Git

author: Udith Indrakantha

linkedin: https://www.linkedin.com/in/udithindrakantha/

description: Surely, everyone who is reading this now knows Git and GitHub. Git is integrated into every developer’s daily routine. Even if it is so, nowadays we rarely use git commands manually. We have extensions and tools with nice UI to deal with Git. With these tools, most of the time, we use only a limited set of Git commands such as `git clone`, `git add`, `git pull`, `git commit`, `git push`, `git stash`, `git checkout` etc.  With this article, today, I am going to unveil another capability that comes with Git and leads to reducing the unnecessary effort in handling several Git repositories. Git submodules and Git subtrees are those two features that support our managing project dependencies.

---
___
### **Motivation**

There are situations when we have to work on several projects that are dependent on each other. For example, let’s say, we are working on a project that needs a library found in a remote GitHub repository. What do we do at such a time? We can clone that library repository somewhere else in the local machine, then copy the whole code to the necessary place in the main project. That’s not that difficult. 

But, what if the library repository keeps being updated often with new features ??
Most of the time, a solution’s front end resides in a separate repository while the backend is maintained in another repository. You probably need to present the whole project in one Git repository. What do you do at such times? 

If there is a huge project with many modules that are maintained by separate teams allocated for each module, will it be easy to maintain a single repository with many branches, pull requests, etc?

There are two options you can go for. Either Git submodules or subtrees. Choose the best that suits your needs.

#### **Git Submodules**

Git submodules are child repositories that reside in a parent repository. To be exact, a Git submodule is **a hyperlink** to a **certain commit** (mostly the HEAD commit) in a **certain branch** (mostly the main branch) of **another Git repository**. 

I’ll show you how to set up submodules step by step with commands. It’s so simple but there are a few things you need to keep in mind also.
I’ll explain the steps with sample demo repositories.

I have three separate repositories named *parent-repository*, *submodule-one*, and *submodule-two* respectively.  I’m going to add the submodule-one repository and the submodule-two repository as two submodules within the parent repository. 

Initially, the parent repository contained only the README.md file.


<img src=”ui_1_2022_11_18.jpg” height="191 px" width="786 px" />

The other two repositories contain a text file named mytext.txt in addition to the README.md files.

**Instance -1**

To add a repository as a submodule in the parent repository, you have to run the following command.

    git submodule add <HTTPS clone URL of the child repository>

For me, I run, 
 git submodule adds https://github.com/Udith-Gayan/submodule-one.git.

This command locally clones the child repository (submodule) into a separate folder within the parent repository, with the child repository’s name as the folder name.

<img src=”ui_2_2022_11_18.jpg” height="191 px" width="786 px" />

In addition to that, it creates another file named “.gitmodules”, in which the reference for the submodule is stored as follows.

<img src=”ui_3_2022_11_18.jpg” height="191 px" width="786 px" />

Now you can commit and push the changes. Once pushed, you can view the GitHub repo below.

<img src=”ui_4_2022_11_18.jpg” height="191 px" width="786 px" />

As in the above image, you can see a folder named, “submodule-one” which is the name of the child repository, and a commit hash (after the sign @) which is the last HEAD commit of the main branch of the child repository, at the moment this submodule-adding command ran. If you click on this folder, you’ll be redirected to the relevant commit in the relevant repository.

Next, I am going to add the second submodule, just following the same command used earlier. I run, 
git submodule add https://github.com/Udith-Gayan/submodule-two.git 

Then, the .gitmodules file gets updated as follows,

<img src=”ui_5_2022_11_18.jpg” height="191 px" width="786 px" />

After committing and pushing, the GitHub repo looks like this.

<img src=”ui_6_2022_11_18.jpg” height="191 px" width="786 px" />

NOTE:

Let’s say, a new commit has been pushed in the repository submodule one. Even if you make a pull from your parent repository, the new changes in the submodule one won’t appear. It is because the reference to the submodule one DOES NOT GET AUTOMATICALLY UPDATED to the new commit. You need to update it manually by running the following commands.

    git submodule update --remote
    git commit -am "Updated submodules"
    git push
    
**Instance -2**

Here we are going to see how to clone a repository that has submodules in it. You can do it in two ways. 
Run

    git clone <parent repository URL> --recursive

Or

    git clone <parent repository URL> 
    git submodule update --init --recursive

Here, the *--init* flag is added if the parent repository has added new submodules, and the *--recursive* flag is added if any submodule itself has submodules.

#### **Git Subtrees**

**Subtrees** are clones of external repositories put into subfolders in the main repository. Subtrees contain source code and the entire commit history of that external repository.

Let’s see how to work with git subtree.

**Instance -1**

Here, we are going to see how to add a new sub-repository to a parent repository. 
Initially, I have a repository named *“Parent-Repository-2”*  as the super repository used in this example. I have a sub-repository named *“submodule-one”* which I used in the previous example for the Git submodule. 

<img src=”ui_7_2022_11_18.jpg” height="191 px" width="786 px" />

<img src=”ui_8_2022_11_18.jpg” height="191 px" width="786 px" />

To add a sub-repository to a super repository, you must follow the steps below. It’s just a single command at the end.

1.	Specify you want to add a subtree
2.	Specify the prefix local directory into which you want to pull the subtree
3.	Specify the remote repository URL [of the subtree being pulled in]
4.	Specify the remote branch [of the subtree being pulled in]
5.	Specify you want to squash all the remote repository's [the subtree's] logs


    git subtree add --prefix {local directory being pulled into} {remote sub-repo URL} {remotebranch}--squash

For example, I run this command locally in the terminal inside my Parent-Repository-2 project.

    git subtree add --prefix submoduleOne https://github.com/Udith-Gayan/submodule-one.git main --squash

You will see, a folder named submoduleOne has been created and inside it, you have all the files in the main branch of the sub repository. This command creates two new commits including the sub-repository’s code. If you run the `git log` command, you will see a response similar to this below.

<img src=”ui_9_2022_11_18.jpg” height="191 px" width="786 px" />

By running `git push`, you can push the commits to the parent remote repository as usual.
This is how it looks after pushing.

<img src=”ui_10_2022_11_18.jpg” height="191 px" width="786 px" />

**Instance -2**

If you want to pull in any new commits to the subtree from its remote, you just have to run the same code and replace ‘add’ with ‘pull’.

    git subtree pull --prefix submoduleOne https://github.com/Udith-Gayan/submodule-one.git main --squash
    
If you make a change to anything in *‘submoduleOne’* the commit will be stored in the parent repository and its logs. That is the biggest change from submodules.
If you now want to update the subtree remote repository with that commit, you must run the same command, excluding --squash and replacing ‘pull’ with ‘push’

    git subtree push --prefix submoduleOne https://github.com/Udith-Gayan/submodule-one.git main

If you freshly clone the parent repository using the `git clone` command, you will instantly have the code files of the subtrees, unlike git submodules where you need to run another command to get the code files of the sub repository.

### **Comparison of subtrees and submodules**

Let’s see some differences between the git submodule and the git subtree.

●	Git submodules have a smaller repository size since they are just links that point to a specific commit in the child project, whereas Git subtrees house the entire child project along with its history.

●	Git submodules need to be accessible in a server, but subtrees are decentralized.

●	Git submodules are mostly used in component-based development, whereas Git subtrees are used in system-based development.

●	Git submodule creates a ‘.gitmodules’ file whereas no extra file is created in the git subtree.

●	Compared to git submodule commands, git subtree commands are painfully long so aliases are necessary.

### **Final Thought**

A Git subtree isn't a direct alternative to a Git submodule. Certain caveats guide where each can be used. If there is an external repository you own and are likely to push code back to, use the Git submodule since it is easier to push. If you have third-party code that you are unlikely to push to, use Git subtree since it is easier to pull.

Thank you.

### **For further reference**

★	https://gitprotect.io/blog/managing-git-projects-git-subtree-vs-submodule/

★	A StackOverflow thread: https://stackoverflow.com/questions/32407634/when-to-use-git-subtree 

★	Mastering Git subtrees: https://medium.com/@porteneuve/mastering-git-subtrees-943d29a798ec 

