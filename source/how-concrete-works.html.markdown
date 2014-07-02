#How Concrete Works

##What is Concrete, what can you do with it

Concrete is a Continous Integration (CI) System.

- Concrete associates a step based workflow to the application and when a build is scheduled to run it executes the workflow. 
	- A workflow consists of one or more steps which are opensource projects that can be imported in concrete (yes, you can develop your own steps and use it in your own build workflow or you can use one that is currently in the system.
	- The steps can send emails, text messages, clone repositories, pass values to each other and many more.
- There's a role system for every application.
	- The User who registers the application in the system is the owner
	- The three roles are:
		- View builds and deploys
		- Create builds and deploys
		- Admin
- After a build is finished you can view the logs of every step that ran during the workflow. The logs can be viewed as "Formatted Output" or "Raw Output"

##How a build works / what’s the process
- First of all the build is triggered. This can happen in 3 ways:
	- pressing the "build now" button on the given application's screen (run manually)
	- after a given time elapsed since the last build (run periodically)
	- after each push to the given branch (run when push arrives)
- A worker is assigned and a Virtual Machine (VM) is created.
- The environment variables are created, that will be used during the build process.
- The workflow steps are executed in the same order as on the workflow page of the application, from top to bottom. (You can also modify the order of the steps by dragging them)
	- For each Step the log it generates is displayed on the page. You can choose to use formatted or raw output.
- After the execution of the steps finished all sourcecodes are erased from the VM and the VM is destroyed.

##Code security
The code downloaded to the worker is only stored until the build finishes. After it the code is deleted and the VM is destroyed.



- Log in with your email and password (if you’re not a member yet click Sign up, enter your email, password and you are ready to build your apps)
- Above all, please note that we would really like to hear what you think about Concrete and on every page there is a ![Feedback](images/how-concrete-works/feedback.png "Feedback"){: .inline-image } icon in the lower  right corner where you can send us a message even with a screenshot.  

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
