## How a build works / what’s the process

- First of all the build is triggered. This can happen in 3 ways:
	- pressing the "build now" button on the application's page (run manually)
	- after each push to the given branch (run when push arrives)
	- with our Trigger API
- A worker is assigned and a Virtual Machine (VM) is created.
- The environment variables are created, that will be used during the build process.
- The workflow steps are executed in the same order as on the workflow page of the application, from top to bottom. (You can also modify the order of the steps by dragging them)
	- For each Step the log it generates is displayed on the page. You can choose to use formatted or raw output.
- After the execution of the steps finished all sourcecodes are erased from the VM and the VM is destroyed.
