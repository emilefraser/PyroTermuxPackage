[![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/11/beginner-s-guide-to-azure-data-factory-icon.svg)](https://www.cathrinewilhelmsen.net/series/beginners-guide-azure-data-factory/)

Raise your hand if you have wondered why you can only _publish_ and not _save_ anything in Azure Data Factory 🙋🏼‍♀️ Wouldn’t it be nice if you could save work in progress? Well, you can. You just need to set up source control first! In this post, we will look at why you should use source control, how to set it up, and how to use it inside Azure Data Factory.

And yeah, I usually recommend that you set up source control _early_ in your project, and not on day 18… However, it does require some external configuration, and in this series I wanted to get through the Azure Data Factory basics first. But by now, you should know enough to decide whether or not to commit to Azure Data Factory as your data integration tool of choice.

Get it? Commit to Azure Data Factory? Source Control? Commit? 🤓

Ok, that was _terrible_, I know. But hey, I’ve been writing these posts for 18 days straight now, let me have a few minutes of fun with Wil Wheaton 😂

Aaaaanyway!

Authoring Modes in Azure Data Factory
-------------------------------------

So far, we’ve been working in the Azure Data Factory mode:

![Screenshot of the Azure Data Factory interface, highlighting the Azure Data Factory authoring mode](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AuthoringModes01AzureDataFactory.png)

If we haven’t set up source control yet, we can do that from the authoring mode menu:

![Screenshot of the Azure Data Factory interface, highlighting the menu option for setting up a source control code repository](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AuthoringModes02SetUpCodeRepository.png)

But once we _have_ set up source control, we can switch between the Azure Data Factory mode and the Source Control mode:

![Screenshot of the Azure Data Factory interface, highlighting the menu for switching between authoring modes](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AuthoringModes03SwitchModes.png)

But what’s the difference between these two modes?

### Azure Data Factory Mode

![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/source-control-adf-circle-white.svg)

When I compare the two authoring modes, I usually refer to the **Azure Data Factory mode** as the “_production mode_“. In this mode, you have to **publish to save**, and that requires everything to validate first. That’s because when you publish, you deploy your solution from the user interface to the Azure Data Factory service. Or the way I think about it, you deploy “_into production_“.

### Source Control Mode

![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/source-control-circle-white.svg)

Just like I refer to the Azure Data Factory mode as “production mode”, I refer to the **source control mode** as “_development mode_“. In this mode, you add an additional step to your development process. First, you **save** your changes in the source control repository, and then you **publish** from the source control repository to the Azure Data Factory service.

### Saving vs. Publishing

We can illustrate saving and publishing using the Azure Data Factory mode and the source control mode like this:

[![Illustration showing that you publish directly when using the Azure Data Factory mode, while you first save and then publish using the source control mode](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AuthoringModes-500x198.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AuthoringModes.png)

By using source control in Azure Data Factory, you get the option to save your work in progress. This is because all you’re really doing is saving the JSON files behind the scenes to the code repository :)

Source Control Options
----------------------

If you click the **set up code repository** button, the **repository settings** pane will open, and you can choose the **repository type**:

[![Screenshot of the Azure Data Factory interface, highlighting the repository type in the repository settings pane](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/SetUpSourceControl01RepositoryType-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/SetUpSourceControl01RepositoryType.png)

You can choose either **Azure DevOps Git** or **GitHub**. From here, I will assume that you already have one of these accounts and have the rights to create new projects and repositories :)

### Azure DevOps

![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/source-control-azure-devops-circle-white.svg)

First, let’s go through how to set up an Azure DevOps code repository, connect our Azure Data Factory to it, then create and save and publish a new dataset. I’m assuming that your user has access to both Azure Data Factory and Azure DevOps.

Warning! There be screenshots. Many, many, many screenshots 🤓

#### Creating an Azure DevOps Code Repository

First, log into [Azure DevOps](http://dev.azure.com/) and choose the organization. I have one called **cathrinew-devops**. Create a **new project**:

[![Screenshot of creating a new Azure DevOps project](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl01-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl01.png)

Go to **repos** -> **files**:

[![Screenshot of navigating to the Azure DevOps code repository](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl02-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl02.png)

A Git code repository must always contain at least one file. Create (**initialize**) the code repository by adding a README file to it:

[![Screenshot of initializing the Azure DevOps code repository](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl03-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl03.png)

We now have our **empty code repository**, ready to go! (_I’m going to ignore the friendly TODO instructions on what to add to my README file for now. But in a real project, I would totally listen to the smart advice and add helpful explanations and descriptions_ 😉)

[![Screenshot of the empty code repository in Azure DevOps](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl04-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl04.png)

#### Connecting to an Azure DevOps Code Repository

Back in Azure Data Factory, click through the settings and specify the **Azure DevOps account**, **project name**, and **git repository name**. I always use **master** as the collaboration branch, and keep **/** as the root folder. Then, add the existing pipelines, datasets, and so on to the code repository by checking **import existing Azure Data Factory resources** to the **collaboration** branch:

[![Screenshot of connecting to an Azure DevOps code repository in Azure Data Factory](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl05-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl05.png)

From now on, whenever you open Azure Data Factory, you will have to choose a **branch** to work in. Notice the new **save all** button, YAY! 🥳

[![Screenshot of the new source control buttons on the toolbar](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl06-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl06.png)

If we switch back to Azure DevOps and refresh the code repository, we will see that all the **imported Azure Data Factory resources**:

[![Screenshot of the imported Azure Data Factory resources in the Azure DevOps code repository](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl07-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl07.png)

We don’t want to work directly in the master branch, though. Let’s create a **new branch**:

[![Screenshot of the create new branch button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl08-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl08.png)

I like to **name** my branches after the feature I’m working on. In this example, I want to create a dataset for the [sets.csv](https://rebrickable.com/downloads/) file:

[![Screenshot of the new branch pane](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl09-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl09.png)

After we have created our new dataset, we can **save all** or **save** the dataset:

[![Screenshot of the new save all and save buttons on the toolbar](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl10-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl10.png)

Woop woop! Saved!

[![Screenshot of a saved dataset](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl11-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl11.png)

But if we try to **publish**, we will be told that we can only **publish from master**, from the collaboration branch. This is a good thing thing! This ensures that everything has to be working in master before we can publish to the Azure Data Factory service:

[![Screenshot of warning that you can only publish from the master branch](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl12-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl12.png)

#### Creating an Azure DevOps Pull Request

When you click on merge the changes to master, you will be taken back to Azure DevOps, where you can create a new **pull request**. This will merge the changes from the _sets_ branch into _master_:

[![Screenshot of a pull request in Azure DevOps](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl13-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl13.png)

Once the pull request has been created, you can **complete** it. Ideally, you want someone else to review and complete it, but let’s just pretend you’re a coworker for now :)

[![Screenshot of the pull request in Azure DevOps, highlighting the complete button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl14-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl14.png)

If you are done with developing the feature, you can also choose to **delete the branch**:

[![Screenshot of the complete pull request screen in Azure DevOps, highlighting the delete branch option](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl15-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl15.png)

Tadaaa! We have **completed** our first pull request:

[![Screenshot of a completed pull request in Azure DevOps](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl16-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl16.png)

When we switch back to Azure Data Factory, we will be asked to choose a **working branch**, since the _sets_ branch was deleted. Let’s choose _master_:

[![Screenshot of choosing a new branch in Azure Data Factory](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl17-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl17.png)

#### Publishing from Master

Now, we can **publish**:

[![Screenshot of publishing from the collaboration branch in Azure Data Factory](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl18-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl18.png)

But! And this is cool :) Instead of just publishing, we can now see **what** is getting published, and whether it’s new, edited, or deleted:

[![Screenshot of the pending changes pane in Azure Data Factory](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl19-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl19.png)

Tadaaa! We have **published** from the collaboration branch:

[![Screenshot of successfully publishing from the collaboration branch in Azure Data Factory](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl20-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/AzureDevOpsSourceControl20.png)

But… what if we prefer working with GitHub? Or what if we want to change the code repository? We can easily do that :)

### GitHub

![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/source-control-github-circle-white.svg)

Next, let’s go through how to set up a GitHub code repository, connect our Azure Data Factory to it, then create and save and publish another dataset. I’m assuming that your user already has a GitHub account.

#### Creating a GitHub Code Repository

First, log into [GitHub](https://github.com/) and create a new **code repository**:

[![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl01-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl01.png)

We now have our **empty code repository**, ready to go!

[![](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl02-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl02.png)

#### Disconnecting from an Existing Code Repository

Next, we need to disconnect from the Azure DevOps code repository. If you are starting from scratch with GitHub, you can skip this part :) Go to the _Home_ page and click on **Git repo settings**:

[![Screenshot of the Azure Data Factory home page, highlighting the Git repo settings button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl03-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl03.png)

Click **remove Git**:

[![Screenshot of the existing repository settings page, highlighting the remove Git button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl04-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl04.png)

Always read the warnings! :) Your Azure DevOps code repository will _not_ be deleted, but you should _publish_ all changes from it before disconnecting. Type the name of your Azure Data Factory and click **Confirm**:

[![Screenshot of the existing repository settings, highlighting the warning message shown when removing an existing repository](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl05-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl05.png)

#### Connecting to a GitHub Code Repository

Click **set up code repository**:

[![Screenshot of the Azure Data Factory home page, highlighting the set up code repository button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl06-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl06.png)

Choose **GitHub** and then log into your GitHub account:

[![Screenshot of the repository settings asking to log into GitHub](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl07-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl07.png)

Specify the **GitHub account** and **git repository name**. I always use **master** as the collaboration branch, and keep **/** as the root folder. Then, add the existing pipelines, datasets, and so on to the code repository by checking **import existing Azure Data Factory resources** to the **collaboration** branch:

[![Screenshot of the repository settings, connecting to GitHub](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl08-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl08.png)

We are now connected to the GitHub code repository, woohoo!

[![Screenshot of the Azure Data Factory interface, highlighting the GitHub toolbar](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl09-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl09.png)

If we switch back to GitHub and refresh the code repository, we will see that all the **imported Azure Data Factory resources**:

[![Screenshot of GitHub, showing the imported Azure Data Factory resources](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl10-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl10.png)

Let’s create another **new branch**:

[![Screenshot of creating a new branch](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl11-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl11.png)

After we have created the new dataset, we can create a **pull request**:

[![Screenshot of the create new pull request button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl12-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl12.png)

#### Creating a GitHub Pull Request

When you create a new pull request, you will be taken back to GitHub. This will merge the changes from the _colors_ branch into _master_. Compare the changes, and click **create pull request**:

[![Screenshot of GitHub, highlighting the create pull request button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl13-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl13.png)

Review the pull request, and click **create pull request**:

[![Screenshot of GitHub, highlighting the create pull request button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl14-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl14.png)

Once the pull request has been created, you can **merge** it. Ideally, you want someone else to review it first, but let’s just pretend you’re a coworker for now :)

[![Screenshot of GitHub, highlighting the merge pull request button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl15-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl15.png)

You can **delete** the branch as well:

[![Screenshot of GitHub, highlighting the delete branch button](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl16-500x300.png)](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/GitHubSourceControl16.png)

Back in Azure Data Factory, you can do the whole publishing loop again :)

Summary
-------

In this post, we looked at why you should use source control, how to set up source control using Azure DevOps and GitHub, and how to use it inside Azure Data Factory.

When we set up source control, you may have noticed another new thing pop up in the interface…

![Screenshot of the Azure Data Factory interface, highlighting the templates menu under factory resources](https://www.cathrinewilhelmsen.net/scribbles/wp-content/uploads/2019/12/SourceControlTemplates.png)

Guess what we will look at in the next post? Yep! [Templates](https://www.cathrinewilhelmsen.net/2019/12/19/templates-azure-data-factory/)!

🤓