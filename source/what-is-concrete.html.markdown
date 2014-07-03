##What is Concrete, what can you do with it

To put it short Concrete is a Continous Integration (CI) System.

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
