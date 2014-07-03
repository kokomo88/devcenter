#How Concrete Works

##A few notes in advance

- **Most importantly a few words about the safty of your code:** 
	- **To guarantee the security of your builds we use virtual machines for builds. Every build runs in it's own virtual machine and we discard the whole virtual machine after the build finishes.**
- Above all, please note that we would really like to hear what you think about Concrete and on every page there is a ![Feedback](images/how-concrete-works/feedback.png "Feedback"){: .inline-image } icon in the lower right corner where you can send us a message even with a screenshot.  

![Feedback](images/how-concrete-works/feedback-bubble.png "Feedback")
 
##App registration

- First there won’t be any apps listed on the left side menu.  

![First dashboard](images/how-concrete-works/no-apps.png "First dashboard")

- Click the New App button to get to the Create App page. 
	- The first step is to select where the given apps code is stored. You can notice that at this step you have to connect a Bitbucket or a GitHub account if you registered using an email address and a password.  
![Add first app](images/how-concrete-works/add-first-app.png "Add first app")
			If you registered eg with Bitbucket account (or after you connect your Bitbucket account) you’ll see a “Use” button under the given source code hosting provider’s icon.  
![Use Bitbucket](images/how-concrete-works/use-bitbucket.png "Use Bitbucket")
	- If you use any other provider, have your own company source hosting solution you can simply add it by clicking the link under the two icons and adding the GIT repository’s SSH URL and SSH private key. When done simply press the “Start validation” button.  
![Select repository host](images/how-concrete-works/select-repo-host.png "Select repository host")
	- After you choose the provider (Github or BitBucket) the next step is to select the repository and click the “Use selected repo” button.  
![Select repository](images/how-concrete-works/select-repo.png "Select repository")
	- Next step is to validate the given repository.

#####A few words about the validation process:
1. First a worker machine is assigned to execute the necessary steps to make sure everything is ready to manage the Application from within Concrete. Your / Your source code’s privacy isn’t at risk. After the process the VM is destroyed and every code is removed.
2. The worker machine clones the given repository.
3. After cloning it searches for Xcode project files and lists the available project files / schemes from every available branch in the repository. During the validation process you get feedback in the “Validation Build logs:” section.
4. **[!] Codes won’t be stored on the worker, will be erased with the VM!**

##Workflow
- Now that you have your first registered app you can start putting the build workflow together.
- A Workflow is a list of Steps that are executed after each other top-to-bottom when the User clicks the “build now” button. The Workflow is managed by the App’s Admin or the App’s Owner.
- But what is a Step? A Step is a public script repository. It has to have a step.sh file that serves as the entry point of the script. There are registered steps, but you can create your own and add it to the Concrete Step Library (see Step Development Guide).
- First you have to add some steps by pressing the “Add new Step” button.

	- When pressing the “Add new Step” button a list is displayed with the Steps registered in Concrete. You can use the “Search…” field to filter the results and find the steps you need. 

	- When you found the Step you would like to add to the Workflow click “Use”, select the version and click “Add to Workflow”.
	- The step is moved to the Workflow and you can specify the details of the given Step or if you choose not to add the step you can click the “Delete” button.

	- When you finished editing the Step simply click the header row of the step to collapse it. (Note that you can view / edit these informations or delete the Step later the same way - by clicking the Step to expand it)
	- The Step is added to the end of your Workflow but you can rearrange the Steps simply by dragging and dropping the given Step.

	- A simple Workflow for an iOS application can look like (in order):
		- Git Clone Repository
		- Run CocoaPods
		- Xcode Build
		- Deploy: TestFlight

##Build
- We have an App and a simple Workflow now we have to configure the project. Select the App and go to the “Settings” tab.  
![App settings](images/how-concrete-works/app-settings.png "App settings")
	- The first section is “Scheduling”. Here you can choose from three options:
		- Run manually: The build will be started if the User, who has privileges to start a build presses the “build now” button.
		- Run periodically: A new build will be started (just like if you'd clicked the "build now" button) after a specific ammount of time.
		- Run when push arrives: When a push arrives to the given branch Concret starts a new build (just like if you'd clicked the "build now" button).
