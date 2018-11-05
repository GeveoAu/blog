---
title: Creating PDF reports using timely triggered Azure Functions V2
author: Ravidu Lashan
linkedin: https://www.linkedin.com/in/ravidulashan
description : Azure Functions, PDF Reporting
---

For any kind of system, reports are essential. It provides statistical analysis about the system which could be used to make managerial decisions about a business, help to attract investors and help to provide useful information about the system to the end users. In this blog post, I’m going to talk about how to create a PDF report in a specific time of the day using an Azure Function. For example, people who are handling e-commerce web sites would like to have a report about total product clicks at the end of each day. Sellers would like to have a report of their total sales at the end of each day etc. 

### Creating Azure Functions

First, we will create an azure function in visual studio. You can follow this [link](https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs) to learn how to create an azure function and publish it to azure. When adding a new Azure function to the azure function project, select Time Trigger as shown in the below diagram.


<img src="/img/ravidu0.PNG" height="277" width="426" />


It will create the following piece of code.

```csharp
public static class Function1
{
    [FunctionName("Function1")]
    public static void Run([TimerTrigger("0 */5 * * * *")]TimerInfo myTimer,    TraceWriter log)
    {
        log.Info($"C# Timer trigger function executed at: {DateTime.Now}");
    }
}
```

### Issues in generating PDF reports in Azure environment

Before starting coding there are few challenges to overcome when you publish the Azure Function in Azure environment. All azure web apps (as well as Mobile App/Services, WebJobs and Functions) run in Azure sandbox which provide limited access to the resources of the deployed machine. The sandbox prevents an app from using most of the kernel’s graphics API, which many pdf generators use either directly or indirectly. You can read more about the Azure sandbox from [here](https://github.com/projectkudu/kudu/wiki/Azure-Web-App-sandbox).

### Solution to overcome the issue

 The same document lists some pdf generators which are allowed by the sandbox environment when you have Basic or higher app service plan. So, if you are using Consumption plan, to succeed in creating PDF reports you must upgrade to basic or higher app service plan. One library which is listed directly or indirectly in the list is wkhtmltopdf. In our attempt we will be using a wrapper around wkhtmltopdf. I could not find a better wrapper implemented in .Net Core which provides our needs. Therefore, I used Tuespechkin library which is a .Net wrapper for wkhtmltopdf library which hides all the P/Invoke messiness. With the Tuespechkin Nuget, you have to install TuesPechkin.Wkhtmltox.AnyCPU Nuget which provides the wkhtmltox.dll for Tuespechkin which enables it to run without any hassle.

### Dependency Injection in Azure function

The next problem you come across when you work with the Azure Functions is the dependency injection. Currently Azure Functions does not have built-in support for dependency injection. So, you can use the following approach to inject your dependencies.

```csharp
public static class IocHelper
{
    private static IServiceCollection _serviceCollection = null;
    private static IServiceProvider _rootServiceProvider = null;
    
    public static async Task<IServiceProvider> GetRootServiceProviderAsync()
    {
        if (_rootServiceProvider == null)
        {
        if (_serviceCollection == null)
        {
        var sc = new ServiceCollection();
        await ConfigureServicesAsync(sc);
         _serviceCollection = sc;
        }
        _rootServiceProvider = _serviceCollection.BuildServiceProvider();
        }
        return _rootServiceProvider;
    }

    public static async Task ExecuteInScopeAsync(string functionName, Func<IServiceProvider, Task> action)
    {
        var serviceProvider = await GetRootServiceProviderAsync();
        using (var scope = serviceProvider.CreateScope())
        {
        try
        {
        await action(scope.ServiceProvider);
        }
        catch (Exception ex)
        {
        throw;
        }
        }
    }
    private static async Task ConfigureServicesAsync(IServiceCollection services)
    {
        services.AddScoped<IDataContext, DataContext>();
    }
}
```
You can configure your dependencies in ConfigureServicesAsync static method.

### Approach

**Step 01**

Create a singleton instance of the pechkin converter as shown below

```csharp
public static class PechkinConverter
{
    private static IConverter converter =
    new ThreadSafeConverter(
    new PdfToolset(
    new WinAnyCPUEmbeddedDeployment (
    new TempFolderDeployment())));
    public static byte[] Convert(HtmlToPdfDocument document)
    {
        byte[] result = new byte[1];
        lock (converter)
        {
        result = converter.Convert(document);
        }
         return result;
    }
}
```

**Step 02**

Create the pdf document as shown below.




```csharp
[FunctionName("PDFGenerator")]
public static void Run([TimerTrigger("0 0 0 * * *")]TimerInfo myTimer, TraceWriter log)
{
    await IocHelper.ExecuteInScopeAsync("PDF Generator", async (services) =>
    {
        var dataContext = services.GetService<IDataContext>();
        var data = dataContext.Sales(); // query database according to need
        var result = // generate the html string here
        var document = new HtmlToPdfDocument
        {
            GlobalSettings =
            {
                ProduceOutline = true,
                DocumentTitle = "Invoice Report",
                PaperSize = PaperKind.A4,
                Margins =
                {
                    All = 1.375,
                    Unit = Unit.Centimeters
                }
                },
                    Objects = {
                    new ObjectSettings { HtmlText = result
                }
            }
        };
        byte[] result = PechkinConverter.Convert(document);
    });        
}
```

This function will run on midnight of everyday and generate the PDF report. One thing to keep in mind is that by default azure functions run on Coordinated Universal Time (UTC). To run the Azure function in specific time zone, add a new app setting named WEBSITE_TIME_ZONE and set the value as shown in the [Microsoft Time Zone Index](https://docs.microsoft.com/en-us/previous-versions/windows/it-pro/windows-vista/cc749073(v=ws.10)). By changing the cron expression ("0 0 0 * * *") you can change the execution time of the azure function.

### References

[https://www.npmjs.com/package/azure-functions-core-tools](https://www.npmjs.com/package/azure-functions-core-tools)

[https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs](https://docs.microsoft.com/en-us/azure/azure-functions/functions-develop-vs)

[https://odetocode.com/blogs/scott/archive/2018/02/14/pdf-generation-in-azure-functions-v2.aspx](https://odetocode.com/blogs/scott/archive/2018/02/14/pdf-generation-in-azure-functions-v2.aspx)

[https://github.com/cratu/TuesPechkin](https://github.com/cratu/TuesPechkin)

[https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-timer](https://docs.microsoft.com/en-us/azure/azure-functions/functions-bindings-timer)

