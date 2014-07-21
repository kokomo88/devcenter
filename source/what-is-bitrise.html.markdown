---
title: What is Bitrise
---

#What is Bitrise, what can you do with it

To put it short Bitrise is a Continous Integration (CI) System with lots of customization options. It provides an easy to use web surface to manage and overview builds, deploys.

Bitrise associates a step based workflow to the application and when a build is scheduled to run it executes the workflow. 

A workflow consists of one or more steps which are opensource projects that can be imported in Bitrise (yes, you can develop your own steps - see our [tutorial on step development](step-dev.html) - and use it in your own build workflow or you can use one that is currently in the system. The steps can do almost anything: send emails, text messages, pass values to each other,   create XCode archive, publish to TestFlight, notify other Users or even gather system information about the VirtualMachine running the process and many more. 

After a build is finished you can browse the logs of every step that ran during the workflow or view the Build info. To make the logs more readable you can even view them as "Formatted Output" or for those who like the terminal feeling more the "Raw Output" can also be viewed.