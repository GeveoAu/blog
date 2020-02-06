---

title: Run Postman API Tests in the Azure DevOps Pipelines

author: Thilanka Weerasinghe

linkedin: https://www.linkedin.com/in/thilankaweerasinghe/

description : APITesting, Azure, POSTMAN

---

How’s your QA experience with API testing so far? Have you ever gone through a
hazel of testing the same thing again and again when you wanted to do a release?
Though all APIs work in the QA environment perfectly and does it fails in the
UAT? As developers do you want to be bug free with your new integration? To
solve all these problems we can introduce run your postman API tests in
continues integration process. In this article I’m going to explain how you can
configure your Azure DevOps pipelines to run your postman scripts.

Configuring pipeline will be divided to 3 main steps:

1. Create test artifacts

2. Run postman scripts

3. Generate report

**01. Create test artifacts**

Test artifacts are the Postman scripts which needs to be execute. There are two
different ways to create test artifacts for release pipeline

**a. Through build pipeline**

Most popular way is to use an existing build pipeline or new pipeline to create
artifacts. Exported postman scripts and environment variables should be added to
the source controller and in the build pipeline it should be copy and published
as aftifacts.

1. Export postman scripts

Your postman collection which you wanted to run in the Azure DevOps pipeline
should be exported.

<img src="/img/Thilanka_1.png" width="400" height="500" />

2. Export environment variables

Environment variable which supports postman scripts should export as well.

<img src="/img/Thilanka_2.png" width="500" height="200" />

3. Add it to source control

Exported postman and environment variable scripts should be added to the source
control in order to access them in the pipeline.

4. Create build pipeline

If there is no exiting pipeline to create artifacts then create a new build
pipeline to create the artifacts using following steps.

i. Select pipeline option of under pipelines menu

<img src="/img/Thilanka_3.png" width="400" height="600" />

ii. Click on New Pipeline button

<img src="/img/Thilanka_4.png" width="800" height="300" />

iii. Select **‘Use the Classic editor ‘** link

<img src="/img/Thilanka_5.png" width="500" height="400" />

iv. Select the source

If the source is Azure Repos Git then project, repository and default branch
should be selected

<img src="/img/Thilanka_6.png" width="500" height="200" />

v. Click on **Empty job**

Empty job option needs to be selected to create the pipeline.

<img src="/img/Thilanka_7.png" width="500" height="300" />

5.Copy postman scripts and environment variables

This task will copy relevant files to specific folder which you can be access in
the release pipeline.

<img src="/img/Thilanka_8.png" width="400" height="200" />

i. Contents: File paths to copy

ii. Target Folder: Target folder which files needs to be copied

6.Publish artifacts

Copied files will be published as artifacts folder called “drop” in order to
access from the release pipeline.

<img src="/img/Thilanka_9.png" width="600" height="300" />

i. Path to Publish: Path which will publish the artifacts

ii. Artifact Name: Name of the artifact

iii. Artifact Publish Location: Location which artifacts should store after
publishing. It can be Azure pipelines, or copy it to a file share which can be
accessible from the build agent.

**b. Directly download from repository**

If postman scripts are maintained in a different repository it can be downloaded
directly to the release pipeline. In this scenario edit the release pipeline and
select that artifacts from relevant repository.

<img src="/img/Thilanka_10.png" width="600" height="300" />

**02. Run scripts in release pipeline**

API scripts needs to be run in the release pipeline after the deployment of new
API. In order to run and get the results following steps needs to be followed.

1.Create new release pipeline or edit existing pipeline

This will be based on the place which you are supposed to run the API scripts.
Either can use a new release pipeline to run scripts or use existing release
pipeline to run the scripts after the deployment of API

Creation steps are as follow:

i. Select **releases** option under pipeline menu

ii. Click **New** button

iii. Select **New release pipeline** option

<img src="/img/Thilanka_11.png" width="400" height="300" />

iv. Select template as **Empty job**

2.Add artifacts

Artifacts need to link to the release pipeline. Artifacts can be coming from
build pipeline or different Azure repository (As mentioned earlier).

Steps are as follow:

i. Click Add button of Artifacts

ii. If from build pipeline: Select relevant project and build pipeline and give
a source alias

<img src="/img/Thilanka_12.png" width="600" height="300" />

3.Create a stage by clicking Add button

<img src="/img/Thilanka_13.png" width="700" height="300" />

4.Create task to Install newman

Task which needs to perform should configure inside the created stage. First
task is to install newman.

Newman is required to run postman scripts. This task will install newman in
agent machine before running postman scripts.

i. Add command line task

<img src="/img/Thilanka_14.png" width="700" height="300" />

ii. Configure it to install newman

```

npm install -g newman

```

<img src="/img/Thilanka_15.png" width="700" height="300" />

5.Create task to run postman scripts

To run postman scripts there should be a command line task to execute the
command line scripts as below.

**Script:**

```

newman<<postman_script_name>>.json -e <<environment_variable_name>>.json --env-var "<<environment_var_to_override>> =<<new_value>>” --reporters cli,junit --reporter-junit-export <<report_name>>

```

**Example:**

```

newman run TestProject_API_SmokeTests.postman_collection.json -e
TestProject_QA_Enviornment.postman_environment.json --env-var
"url=http://api.qa.testproject.com" --reporters cli,junit
--reporter-junit-export Results\\apiTestResults.xml

```

Working directly should be clearly mentioned according to the place which has
postman scripts

<img src="/img/Thilanka_16.png" width="700" height="300" />

**03. Generate report**

Tests results will be published as junit test results. For that it will use the
test results file generated.

1. Add publish test results task

<img src="/img/Thilanka_17.png" width="700" height="300" />

Now it’s all set to go. Once you create the release you will be able to see the
test results as below.

<img src="/img/Thilanaka_18.png" width="700" height="300" />
