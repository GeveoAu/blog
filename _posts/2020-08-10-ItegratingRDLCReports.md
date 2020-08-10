---

title: Integrating RDLC reports to .NET Core

author: Tharindu Jayasinghe

linkedin: https://www.linkedin.com/in/tharindu-jayasinghe-0b734817/

description : One of the biggest challenges faces by many developers when moving from standard .NET framework to .NET CORE is the lack of support for RDLC reports. Microsoft has not come up with a solution for this yet. (The time I write this). There are lot of discussions going on many forums asking Microsoft to come up with a solution for this.

---

Integrating RDLC reports to .NET Core

One of the biggest challenges faces by many developers when moving from standard .NET framework to .NET CORE is the lack of support for RDLC reports. Microsoft has not come up with a solution for this yet. (The time I write this). There are lot of discussions going on many forums asking Microsoft to come up with a solution for this.

[https://forums.asp.net/t/2156712.aspx?Calling+RDLC+in+asp+net+core](https://forums.asp.net/t/2156712.aspx?Calling+RDLC+in+asp+net+core)

There are couple of solutions available at the moment as mentioned in here. But is no end to end solution how you are supposed to do that.

Out of this solutions I have picked ASP.NET Core reporting library in order to cater my requirement. [https://www.nuget.org/packages/AspNetCore.Reporting](https://www.nuget.org/packages/AspNetCore.Reporting)

In this article I am going to explain how you can integrate .NET Core Reporting library to your .NET core API. (Similarly you can integrate it to you azure function app as well).

The benefit of this library:

- Open source
- Comes as a nugget package and easy to implement.

Issues in the library

- Issue related to Caching when there are multiple RDLC files.

When there are multiple rdlc files available, the render function does not use the correct rdlc file. It mixes the content with the first ran rdlc file. It seems to be like a caching issue in the memory used to render the rdlc file.

How to overcome the issue

You can run a separate process within the API or Azure function and delegate the report generation logic to that process and start the process within the api or function. I will write a supplementary blog post on how to do this soon. First let&#39;s see how we can generate a pdf using a single rdlc file.

Create .NET core API project.

First you need to create your .NET core Project. (API or Azure Function app)

<img src="/img/tj_01_2020_08.png" height="315" width="600" />

Go to manage nuget packages and Install AspNetCore.Reporting library to the project.

<img src="/img/tj_02_2020_08.png" height="315" width="600" />

You also need to add the System.Drawing.Common Nuget package into your project.

<img src="/img/tj_03_2020_08.png" height="260" width="650" />

Also add System.Text.Encoding.CodePages Nuget to your project.

<img src="/img/tj_04_2020_08.png" height="260" width="650" />

Now you can create your RDLC and generate a pdf out of it. In VS you don&#39;t get templates for RDLC files yet. So assume you have a RDLC file which supported in .NET framework. Copy it to your project. Make sure you set the property of RDLC file to copy always. This way if there are changes to the rdlc file the changed rdlc file will also be there in the output folder.

<img src="/img/tj_05_2020_08.png" height="250" width="600" />
Following is my Solution file structure.

<img src="/img/tj_06_2020_08.png" height="662" width="432" />

In order to add dataset to your rdlc file using a Dto Object that you have created you need to create a separate project with the Dtos and add a reference to the Api project. In my example I have a created a **Report.Data (.NET Standard)** project and added a reference to my Report Api Project.

Here&#39;s how to add DataSet using the Dtos you have created.

<img src="/img/tj_07_2020_08.png" height="302" width="750" />
<img src="/img/tj_08_2020_08.png" height="386" width="490" />
<img src="/img/tj_09_2020_08.png" height="386" width="490" />
<img src="/img/tj_10_2020_08.png" height="505" width="680" />

Once you add the dataset you can set the dataset fields to a table as shown below.

<img src="/img/tj_11_2020_08.png" height="370" width="750" />

There are lot of customizations can be done with the RDLC designer. I&#39;m assuming you are already familiar with it. If not please follow a tutorial regarding rdlc report designing. Now let&#39;s look at more importantly how you can call this rdlc file to generate a pdf file.

Report Controller class
```csharp
[Route(&quot;api/[controller]&quot;)]

publicclassReportController : Controller

{

private IReportService \_reportService;

public ReportController(IReportService reportService)

{

\_reportService = reportService;

}

[HttpGet(&quot;{reportName}&quot;)]

public ActionResult Get(string reportName)

{

var returnString = \_reportService.GenerateReportAsync(reportName);

return File(returnString, System.Net.Mime.MediaTypeNames.Application.Octet, reportName + &quot;.pdf&quot;);

}

}

Report Service class

publicclassReportService : IReportService

{

publicbyte[] GenerateReportAsync(string reportName)

{

string fileDirPath = Assembly.GetExecutingAssembly().Location.Replace(&quot;ReportAPI.dll&quot;, string.Empty);

string rdlcFilePath = string.Format(&quot;{0}ReportFiles\\{1}.rdlc&quot;, fileDirPath, reportName);

Dictionary\&lt;string, string\&gt; parameters = new Dictionary\&lt;string, string\&gt;();

Encoding.RegisterProvider(CodePagesEncodingProvider.Instance);

Encoding.GetEncoding(&quot;windows-1252&quot;);

LocalReport report = new LocalReport(rdlcFilePath);

List\&lt;UserDto\&gt; userList = new List\&lt;UserDto\&gt;();

userList.Add(new UserDto

{

FirstName = &quot;Alex&quot;,

LastName = &quot;Smith&quot;,

Email = &quot;alex.smith@gmail.com&quot;,

Phone = &quot;2345334432&quot;

});

userList.Add(new UserDto

{

FirstName = &quot;John&quot;,

LastName = &quot;Legend&quot;,

Email = &quot;john.legend@gmail.com&quot;,

Phone = &quot;5633435334&quot;

});

userList.Add(new UserDto

{

FirstName = &quot;Stuart&quot;,

LastName = &quot;Jones&quot;,

Email = &quot;stuart.jones@gmail.com&quot;,

Phone = &quot;3575328535&quot;

});

report.AddDataSource(&quot;dsUsers&quot;, userList);

var result = report.Execute(GetRenderType(&quot;pdf&quot;), 1, parameters);

return result.MainStream;

}

private RenderType GetRenderType(string reportType)

{

var renderType = RenderType.Pdf;

switch (reportType.ToLower())

{

default:

case&quot;pdf&quot;:

renderType = RenderType.Pdf;

break;

case&quot;word&quot;:

renderType = RenderType.Word;

break;

case&quot;excel&quot;:

renderType = RenderType.Excel;

break;

}

return renderType;

}

}
```
If you follow the steps correctly now you can call your controller method by browser url and the browser will give you the pdf generated as below.

<img src="/img/tj_12_2020_08.png" height="422" width="933" />
