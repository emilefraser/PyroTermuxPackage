Best Practices for Implementing Azure DataFactory
=================================================

My colleagues and friends from the community keep asking me the same thing… What are the best practices from using Azure Data Factory (ADF)? With any emerging, rapidly changing technology I’m always hesitant about the answer. However, after 5 years of working with ADF I think its time to start suggesting what I’d expect to see in any good Data Factory, one that is running in production as part of a wider data platform solution. We can call this technical standards or best practices if you like. In either case, I would phrase the question; what makes a good Data Factory implementation?

The following are my suggested answers to this and what I think makes a good Data Factory. Hopefully together we can mature these things into a common set of best practices or industry standards when using the cloud resource. Some of the below statements might seem obvious and fairly simple. But maybe not to everybody, especially if your new to ADF. As an overview, I’m going to cover the following points:

*   Environment Setup & Developer Debugging _(updated)_
*   Deployments _(new)_
*   Automated Testing _(new)_
*   Naming Conventions
*   Pipeline Hierarchies
*   Pipeline & Activity Descriptions _(updated)_
*   Factory Component Folders
*   Linked Service Security via Azure Key Vault
*   Dynamic Linked Services _(new)_
*   Generic Datasets _(updated)_
*   Metadata Driven Processing _(updated)_
*   Parallel Execution
*   Hosted Integration Runtimes
*   Azure Integration Runtimes
*   Wider Platform Orchestration
*   Custom Error Handler Paths _(updated)_
*   Monitoring via Log Analytics _(updated)_
*   Service Limitations _(new)_
*   Using Templates
*   Documentation

Let’s start, my ADF best practices:

* * *

### Environment Setup & Developer Debugging

Having a clean separation of resources for development, testing and production. Obvious for any solution, but when applying this to ADF, I’d expect to see the development service connected to source control as a minimum. Using Azure DevOps or GitHub doesn’t matter, although authentication against Azure DevOps is slightly simpler within the same tenant. Then, that development service should be used with multiple code repository branches that align to backlog features. Next, I’d expect developers working within those code branches to be using the ADF debug feature to perform basic end to end testing of newly created pipelines and using break points on activities as required. Pull requests of feature branches would be peer reviewed before merging into the main delivery branch and published to the development Data Factory service. Having that separation of debug and development is important to understand for that first Data Factory service and even more important to get it connected to a source code system.

For clarification, other downstream environments (test, UAT, production) do not need to be connected to source control.

![img](https://mrpaulandrew.files.wordpress.com/2019/12/adf-releases.png?w=700&h=155)





Final thoughts on environment setup. Another option and technique I’ve used in the past is to handle different environment setups internally to Data Factory via a Switch activity. In this situation a central variable controls which activity path is used at runtime. For example, having different Databricks clusters and Linked Services connected to different environment activities:



![img](https://mrpaulandrew.files.wordpress.com/2020/01/adf-switch-vs-db-notebook.png?w=700&h=579)



This is probably a special case and nesting activities via a ‘Switch’ does come with some drawbacks. This is not a best practice, but an alternative approach you might want to consider. I blogged about this in more detail [here](https://mrpaulandrew.com/2020/01/22/using-the-azure-data-factory-switch-activity/).

### Deployments

Leading on from our environment setup the next thing to call out is how we handle our Data Factory deployments. The obvious choice might be to use ARM templates. However, this isn’t what I’d recommend as an approach (sorry Microsoft). The ARM templates are fine for a complete deployment of everything in your Data Factory, maybe for the first time, but they don’t offer any granular control over specific components and by default will only expose Linked Service values as parameters.

My approach for deploying Data Factory would be to use PowerShell cmdlets and the JSON definition files found in your source code repository, this would also be supported by a config file of component lists you want to deploy. Generally this technique of deploying Data Factory parts with a 1:1 between PowerShell cmdlets and JSON files offers much more control and options for dynamically changing any parts of the JSON at deployment time. But, is does mean you have to manually handle component dependencies and removals, if you have any. A quick visual of the approach:



![img](https://mrpaulandrew.files.wordpress.com/2020/04/adf-deployment-with-powershell.png?w=700)



To elaborate, the PowerShell uses the artifacts created by Data Factory in the ‘normal’ repository code branches (not the **adf\_publish** branch). Then for each component provides this via a configurable list as a definition file to the respective PowerShell cmdlets. The cmdlets use the `DefinitionFile` parameter to set exactly what you want in your Data Factory given what was created by the repo connect instance.

Sudo PowerShell and JSON example below building on the visual representation above, click to enlarge.



![img](https://mrpaulandrew.files.wordpress.com/2020/04/sudo-code-for-deploying-data-factory-1.png?w=700&h=533)



If you think you’d like to use this approach, but don’t want to write all the PowerShell yourself, great news, my friend and colleague [Kamil Nowinski](https://twitter.com/NowinskiK) has done it for you in the form of a PowerShell module (**azure.datafactory.tools**). Check out his GitHub repository [here](https://github.com/SQLPlayer/azure.datafactory.tools). This also can now handle dependencies.

### Automated Testing

[](https://mrpaulandrew.files.wordpress.com/2020/07/adf-pipeline-pass-fail.png)To complete our best practices for environments and deployments we need to consider testing. Given the nature of Data Factory as a cloud service and an orchestrator what should be tested often sparks a lot of debate. Are we testing the pipeline code itself, or what the pipeline has done in terms of outputs? Is the business logic in the pipeline or wrapped up in an external service that the pipeline is calling?



![img](https://mrpaulandrew.files.wordpress.com/2020/07/adf-pipeline-pass-fail.png?w=700)



The other problem is that a pipeline will need to be published/deployed in your Data Factory instance before any external testing tools can execute it as a pipeline run/trigger. This then leads to a chicken/egg situation of wanting to test before publishing/deploying, but not being able to access your Data Factory components in an automated way via the debug area of the resource.

Currently my stance is simple:

*   Perform basic testing using the repository connected Data Factory debug area and development environment.
*   Deploy all your components to your Data Factory test instance. This could be in your wider test environment or as a dedicated instance of ADF just for testing publish pipelines.
*   Run everything end to end (if you can) and see what breaks.
*   Inspect activity inputs and outputs where possible and especially where expressions are influencing pipeline behaviour.

Another friend and ex-colleague [Richard Swinbank](https://twitter.com/RichardSwinbank) has a great blog series on running these pipeline tests using an NUnit project in Visual Studio. Check it out [here](https://richardswinbank.net/tag/adftesting?do=showtag&tag=adftesting).

### Naming Conventions

Hopefully we all understand the purpose of good naming conventions for any resource. However, when applied to Data Factory I believe this is even more important given the expected umbrella service status ADF normally has within a wider solution. Firstly, we need to be aware of the rules enforced by Microsoft for different components, here:

[https://docs.microsoft.com/en-us/azure/data-factory/naming-rules](https://docs.microsoft.com/en-us/azure/data-factory/naming-rules)

Unfortunately there are some inconsistencies to be aware of between components and what characters can/can’t be used. Once considered we can label things as we see fit. Ideally without being too cryptic and while still maintaining a degree of human readability.

For example, a linked service to an Azure Functions App, we know from the icon and the linked service type what resource is being called. So we can omit that part. As a general rule I think understanding why we have something is a better approach when naming it, rather than what it is. What can be inferred with its context.

Finally, when considering components names, be mindful that when injecting expressions into things, some parts of Data Factory don’t like spaces or things from names that could later break the JSON expression syntax.

### Pipeline Hierarchies

[](https://mrpaulandrew.files.wordpress.com/2019/09/adf-gpc-pipelines.png)I’ve blogged about the adoption of pipeline hierarchies as a pattern before ([here](https://mrpaulandrew.com/2019/09/25/azure-data-factory-pipeline-hierarchies-generation-control/)) so I won’t go into too much detail again. Other than to say its a great technique for structuring any Data Factory, having used it on several different projects…

*   Grandparent
*   Parent
*   Child
*   Infant



![img](https://mrpaulandrew.files.wordpress.com/2019/09/adf-gpc-pipelines.png?w=128&h=150)





### Pipeline & Activity Descriptions

![img](https://mrpaulandrew.files.wordpress.com/2019/12/pipeline-description.png?w=700)

[](https://mrpaulandrew.files.wordpress.com/2019/12/pipeline-description.png)Every Pipeline and Activity within Data Factory has a none mandatory description field. I want to encourage all of us to start making better use of it. When writing any other code we typically add comments to things to offer others an insight into our original thinking or the reasons behind doing something. I want to see these description fields used in ADF in the same way. A good naming convention gets us partly there with this understanding, now let’s enrich our Data Factory’s with descriptions too. Again, explaining why and how we did something. In a [this blog post](https://mrpaulandrew.com/2019/12/19/summarise-my-azure-data-factory-arm-template-using-t-sql/) I show you how to parse the JSON from a given Data Factory ARM template, extract the description values and make the service a little more self documenting.

### Factory Component Folders

[](https://mrpaulandrew.files.wordpress.com/2019/12/adf-folders.png)Folders and sub-folders are such a great way to organise our Data Factory components, we should all be using them to help ease of navigation. Be warned though, these folders are only used when working within the Data Factory portal UI. They are not reflected in the structure of our source code repo.

![img](https://mrpaulandrew.files.wordpress.com/2019/12/adf-folders.png?w=700)



https://mrpaulandrew.files.wordpress.com/2019/12/adf-folders-json.png

Adding components to folders is a very simple drag and drop exercise or can be done in bulk if you want to attack the underlying JSON directly. Subfolders get applied using a forward slash, just like other file paths.

Also be warned, if developers working in separate code branches move things affecting or changing the same folders you’ll get conflicts in the code just like other resources. Or in some cases I’ve seen duplicate folders created where the removal of a folder couldn’t naturally happen in a pull request. That said, I recommend organising your folders early on in the setup of your Data Factory. Typically for customers I would name folders according to the business processes they relate to.

### Linked Service Security via Azure Key Vault

[](https://mrpaulandrew.files.wordpress.com/2018/11/key-vault-icon.png)Azure Key Vault is now a core component of any solution, it should be in place holding the credentials for all our service interactions. In the case of Data Factory most linked service connections support the obtaining of values from Key Vault. Where ever possible we should be including this extra layer of security and allowing only Data Factory to retrieve secrets from Key Vault using its own Managed Identity.

![img](https://mrpaulandrew.files.wordpress.com/2018/11/key-vault-icon.png?w=700)

If you aren’t familiar with this approach check out this Microsoft Doc pages:

[https://docs.microsoft.com/en-us/azure/data-factory/store-credentials-in-key-vault](https://docs.microsoft.com/en-us/azure/data-factory/store-credentials-in-key-vault)

Be aware that when working with custom activities in ADF using Key Vault is essential as the Azure Batch application can’t inherit credentials from the Data Factory linked service references.

### Dynamic Linked Services

Reusing code is always a great time savers and means you often have a smaller foot print to update when changes are needing. With Data Factory linked services add dynamic content was only supported for a handful of popular connection types. However, now we can make all linked services dynamic (as required) using the feature and tick box called ‘**Specify dynamic contents in JSON format**‘. I’ve blogged about using this option in a separate post [here](https://mrpaulandrew.com/2020/07/14/how-to-use-specify-dynamic-contents-in-json-format-in-azure-data-factory-linked-services/).



![img](https://mrpaulandrew.files.wordpress.com/2020/07/adf-ls-dynamic-content-kv-tick-1.png?w=700)

Create your complete linked service definitions using this option and expose more parameters in your pipelines to complete the story for dynamic pipelines.

### Generic Datasets

![img](https://mrpaulandrew.files.wordpress.com/2019/12/genericdataset.png?w=700)

[](https://mrpaulandrew.files.wordpress.com/2019/12/genericdataset.png)Where design allows it I always try to simplify the number of datasets listed in a Data Factory. In version 1 of the resource separate hard coded datasets were required as the input and output for every stage in our processing pipelines. Thankfully those days are in the past. Now we can use a completely metadata driven dataset for dealing with a particular type of object against a linked service. For example, one dataset of all CSV files from Blob Storage and one dataset for all SQLDB tables.



At runtime the dynamic content underneath the datasets are created in full so monitoring is not impacted by making datasets generic. If anything, debugging becomes easier because of the common/reusable code.

Where generic datasets are used I’d expect the following values to be passed as parameters. Typically from the pipeline, or resolved at runtime within the pipeline.

*   **Location** – the file path, table location or storage container.
*   **Name** – the file or table name.
*   **Structure** – the attributes available provided as an array at runtime.

To be clear, I wouldn’t go as far as making the linked services dynamic. Unless we were really confident in your controls and credential handling. If you do, the linked service parameters will also need to be addressed, firstly at the dataset level, then in the pipeline activity. It really depends how far you want to go with the parameters.

### Metadata Driven Processing

Building on our understanding of generic datasets and dynamic linked service, a good Data Factory should include (where possible) generic pipelines, these are driven from metadata to simplify (as a minimum) data ingestion operations. Typically I use an Azure SQLDB to house my metadata with stored procedures that get called via Lookup activities to return everything a pipeline needs to know.

![img](https://mrpaulandrew.files.wordpress.com/2019/12/metadata-driven-ingestion.png?w=700)

This metadata driven approach means deployments to Data Factory for new data sources are greatly reduced and only adding new values to a database table is required. The pipeline itself doesn’t need to be complicated. Copying CSV files from a local file server to Data Lake Storage could be done with just three activities, shown below.



![img](https://mrpaulandrew.files.wordpress.com/2020/06/repo-image.png?w=700&h=350)



Building on this I’ve since created a complete metadata driven processing framework for Data Factory that I call ‘**ADF.procfwk**‘. Check out the complete blog series and GitHub repository if you’d like to adopt this as an open source solution.

*   [https://mrpaulandrew.com/category/azure/data-factory/adf-procfwk/](https://mrpaulandrew.com/category/azure/data-factory/adf-procfwk/)
*   [https://github.com/mrpaulandrew/ADF.procfwk](https://github.com/mrpaulandrew/ADF.procfwk)

### Parallel Execution

Given the scalability of the Azure platform we should utilise that capability wherever possible. When working with Data Factory the ‘ForEach’ activity is a really simple way to achieve the parallel execution of its inner operations. By default, the ForEach activity does not run sequentially, it will spawn 20 parallel threads and start them all at once. Great! It also has a maximum batch count of 50 threads if you want to scale things out even further. I recommend taking advantage of this behaviour and wrapping all pipelines in ForEach activities where possible.  





![img](https://mrpaulandrew.files.wordpress.com/2019/12/foreach-settings.png?w=700)

[](https://mrpaulandrew.files.wordpress.com/2019/12/foreach-settings.png)  
In case you weren’t aware within the ForEach activity you need to use the syntax **@{item().SomeArrayValue}** to access the iteration values from the array passed as the ForEach input.

### Hosted Integration Runtimes

Currently if we want Data Factory to access our on premises resources we need to use the Hosted Integration runtime (previously called the Data Management Gateway). When doing so I suggest the following two things be taken into account as good practice:



![img](https://mrpaulandrew.files.wordpress.com/2019/12/adf-hosted-ir-express-route-vs-not.png?w=700)



1.  Add multiple nodes to the hosted IR connection to offer the automatic failover and load balancing of uploads. Also, make sure you throttle the currency limits of your secondary nodes if the VM’s don’t have the same resources as the primary node. More details here: [https://docs.microsoft.com/en-us/azure/data-factory/create-self-hosted-integration-runtime](https://docs.microsoft.com/en-us/azure/data-factory/create-self-hosted-integration-runtime)
2.  When using Express Route or other private connections make sure the VM’s running the IR service are on the correct side of the network boundary. If you upgrade to Express Route later in the project and the Hosted IR’s have been installed on local Windows boxes, they will probably need to be moved. Consider this in your future architecture and upgrade plans.

### Azure Integration Runtimes

When turning our attention to the Azure flavour of the Integration Runtime I typically like to update this by removing its freedom to auto resolve to any Azure Region. There can be many reasons for this; regulatory etc. But as a starting point, I simply don’t trust it not to charge me data egress costs if I know which region the data is being stored.



![img](https://mrpaulandrew.files.wordpress.com/2019/12/manually-set-adf-ir.png?w=700)



Also, given the new Data Flow features of Data Factory we need to consider updating the cluster sizes set and maybe having multiple Azure IR’s for different Data Flow workloads.

In both cases these options can easily be changed via the portal and a nice description added. Please make sure you tweak these things before deploying to production and align Data Flows to the correct clusters in the pipeline activities.

Finally, be aware that the IR’s need to be set at the linked service level. Although we can more naturally think of them as being the compute used in our Copy activity, for example.

### Wider Platform Orchestration

In Azure we need to design for cost, I never pay my own Azure Subscription bills, but even so. We should all feel accountable for wasting money. To that end, pipelines should be created with activities to control the scaling of our wider solution resources.

![img](https://mrpaulandrew.files.wordpress.com/2019/12/scaling-sqldb.png?w=700&h=120)

*   For a SQLDB, scale it up before processing and scale it down once finished.
*   For a SQLDW (Synapse SQL Pool), start the cluster before processing, maybe scale it out too. Then pause it after.
*   For Analysis service, resume the service to process the models and pause it after. Maybe, have a dedicated pipeline that pauses the service outside of office hours.
*   For Databricks, create a linked services that uses job clusters.
*   For Function Apps, consider using different App Service plans and make best use of the free consumption (compute) offered where possible.

You get the idea. Check with the bill payer, or pretend you’ll be getting the monthly invoice from Microsoft.

Building pipelines that don’t waste money in Azure Consumption costs is a practice that I want to make the technical standard, not best practice, just normal and expected in a world of ‘Pay-as-you-go’ compute.

I go into greater detail on the SQLDB example in a previous blog post, [here](https://mrpaulandrew.com/2019/06/18/azure-data-factory-web-hook-vs-web-activity/).

### Custom Error Handler Paths

Our Data Factory pipelines, just like our SSIS packages deserve some custom logging and error paths that give operational teams the detail needed to fix failures. For me, these boiler plate handlers should be wrapped up as ‘Infant’ pipelines and accept a simple set of details:

*   Calling pipeline name.
*   Run ID of the failed execution.
*   Custom details coded into the process.

Everything else can be inferred or resolved by the error handler.

Once established, we need to ensure that the processing routes within the parent pipeline are connected correctly. OR not AND. All too often I see error paths not executed because the developer is expecting activity 1 AND activity 2 AND activity 3 to fail before its called. Please don’t make this same mistake. Shown below.



![img](https://mrpaulandrew.files.wordpress.com/2019/12/error-handling-paths-in-adf.png?w=700&h=718)



Finally, if you would like a better way to access the activity error details within your handler pipeline I suggest using an Azure Function. In [this blog post](https://mrpaulandrew.com/2020/04/22/get-any-azure-data-factory-pipeline-activity-error-details-with-azure-functions/) I show you how to do this and return the complete activity error messages.

![img](https://mrpaulandrew.files.wordpress.com/2020/07/adf-get-activity-error-with-function.png?w=700&h=311)



### Monitoring via Log Analytics

[](https://mrpaulandrew.files.wordpress.com/2019/12/adf-to-log-analytics.png)Like most Azure Resources we have the ability via the ‘Diagnostic Settings’ to output telemetry to Log Analytics. The out-of-box monitoring area within Data Factory is handy, but it doesn’t deal with any complexity. Having the metrics going to Log Analytics as well is a must have for all good factories. The experience is far richer and allows operational dashboards to be created for any/all Data Factory’s.

Screen snippet of the custom query builder shown below, click to enlarge.

When you multiple Data Factory’s going to the same Log Analytics instance break out the Kusto queries to return useful information for all your orchestrators and pin the details to a shareable Azure Portal dashboard. For example:

`ADFPipelineRun`  
`| project TimeGenerated, Start, End, ['DataFactory'] = substring(ResourceId, 121, 100), Status, PipelineName , Parameters, ["RunDuration"] = datetime_diff('Minute', End, Start)`  
`| where TimeGenerated > ago(1h) and Status !in ('InProgress','Queued')`

![img](https://mrpaulandrew.files.wordpress.com/2019/12/adf-output-to-log-analytics.png?w=700&h=554)



![img](https://mrpaulandrew.files.wordpress.com/2020/06/portal-screen-shot-2.png?w=700&h=474)

### Service Limitations

[](https://mrpaulandrew.files.wordpress.com/2020/01/adf-ceiling.png)Please be aware that Azure Data Factory does have limitations. Both internally to the resource and across a given Azure Subscription. When implementing any solution and set of environments using Data Factory please be aware of these limits. To raise this awareness I created a separate blog post about it [here](https://mrpaulandrew.com/2020/01/29/azure-data-factory-resource-limitations/) including the latest list of conditions.

The limit I often encounter is where you can only have 40 activities per pipeline. Of course, with metadata driven things this is easy to overcome or you could refactor pipelines in parent and children as already mentioned above. As a best practice, just be aware and be careful. Maybe also check with Microsoft what are hard limits and what can easily be adjusted via a support ticket.



![img](https://mrpaulandrew.files.wordpress.com/2020/01/adf-ceiling.png?w=300&h=83)



### Using Templates

Pipeline templates I think are a fairly under used feature within Data Factory. They can be really powerful when needing to reuse a set of activities that only have to be provided with new linked service details. And if nothing else, getting Data Factory to create SVG’s of your pipelines is really handy for documentation too. I’ve even used templates in the past to snapshot pipelines when source code versioning wasn’t available. A total hack, but it worked well.

Like the other components in Data Factory template files are stored as JSON within our code repository. Each template will have a **manifest.json** file that contains the vector graphic and details about the pipeline that has been captured. Give them a try people.

### Documentation

Lastly, for this blog post! Do I really need to call this out as a best practice?? Every good Data Factory should be documented. As a minimum we need somewhere to capture the business process dependencies of our Data Factory pipelines. We can’t see this easily when looking at a portal of folders and triggers, trying to work out what goes first and what goes upstream of a new process. I use Visio a lot and this seems to be the perfect place to create (what I’m going to call) our Data Factory Pipeline Maps. Maps of how all our orchestration hang together. Furthermore, if we created this in Data Factory the layout of the child pipelines can’t be saved, so its much easier to visualise in Visio. I recommend we all start creating something similar to the example below.



![img](https://mrpaulandrew.files.wordpress.com/2019/12/adf-map.png?w=700&h=415)

* * *

### Data Factory Limitations

I copied this table exactly as it appears for Data Factory on 22nd Jan 2019. References at the bottom.

| Resource                                                     | Default limit | Maximum limit                                                |
| ------------------------------------------------------------ | ------------- | ------------------------------------------------------------ |
| Data factories in an Azure subscription                      | 50            | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Total number of entities, such as pipelines, data sets, triggers, linked services, and integration runtimes, within a data factory | 5,000         | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Total CPU cores for Azure-SSIS Integration Runtimes under one subscription | 256           | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Concurrent pipeline runs per data factory that’s shared among all pipelines in the factory | 10,000        | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Concurrent External activity runs per subscription per [Azure Integration Runtime region](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/data-factory/concepts-integration-runtime.md#integration-runtime-location)  
External activities are managed on integration runtime but execute on linked services, including Databricks, stored procedure, HDInsights, Web, and others. | 3000 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Concurrent Pipeline activity runs per subscription per [Azure Integration Runtime region](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/data-factory/concepts-integration-runtime.md#integration-runtime-location)  
Pipeline activities execute on integration runtime, including Lookup, GetMetadata, and Delete. | 1000 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Concurrent authoring operations per subscription per [Azure Integration Runtime region](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/data-factory/concepts-integration-runtime.md#integration-runtime-location)  
Including test connection, browse folder list and table list, preview data. | 200 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Concurrent Data Integration Units1 consumption per subscription per [Azure Integration Runtime region](https://github.com/MicrosoftDocs/azure-docs/blob/master/articles/data-factory/concepts-integration-runtime.md#integration-runtime-location) | Region group 12: 6000  
Region group 22: 3000  
Region group 32: 1500 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Maximum activities per pipeline, which includes inner activities for containers | 40 | 40 |
| Maximum number of linked integration runtimes that can be created against a single self-hosted integration runtime | 100 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Maximum parameters per pipeline | 50 | 50 |
| ForEach items | 100,000 | 100,000 |
| ForEach parallelism | 20 | 50 |
| Maximum queued runs per pipeline | 100 | 100 |
| Characters per expression | 8,192 | 8,192 |
| Minimum tumbling window trigger interval | 15 min | 15 min |
| Maximum timeout for pipeline activity runs | 7 days | 7 days |
| Bytes per object for pipeline objects3 | 200 KB | 200 KB |
| Bytes per object for dataset and linked service objects3 | 100 KB | 2,000 KB |
| Data Integration Units1 per copy activity run | 256 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Write API calls | 1,200/h
This limit is imposed by Azure Resource Manager, not Azure Data Factory.

 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Read API calls | 12,500/h

This limit is imposed by Azure Resource Manager, not Azure Data Factory.

 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Monitoring queries per minute | 1,000 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Entity CRUD operations per minute | 50 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Maximum time of data flow debug session | 8 hrs | 8 hrs |
| Concurrent number of data flows per factory | 50 | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |
| Concurrent number of data flow debug sessions per user per factory | 3 | 3 |
| Data Flow Azure IR TTL limit | 4 hrs | [Contact support](https://azure.microsoft.com/blog/2014/06/04/azure-limits-quotas-increase-requests/). |

That’s all folks. If you have done all of the above when implementing Azure Data Factory then I salute you

Many thanks for reading. Comments and thoughts very welcome. Defining best practices is always hard and I’m more than happy to go first and get them wrong a few times while we figure it out together