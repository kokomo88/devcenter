---
title: How Bitrise Works
---

#How Bitrise Works <a name="HowBitriseWorks"></a>

The main pillar of Bitrise are the Virtual Machines. Using Virtual Machines provides the desired [Code Security](code-security.html) by creating a new Machine to execute your Workflow and dispose the whole Virtual Machine after the workflow finished.

First you have to [register an Application](bitrise-step-by-step.html#AppRegistration). Now you can [start putting the workflow together](bitrise-step-by-step.html#Workflow). Keep in mind the steps are executed from top-to-bottom so don't forget the dependencies (eg.: you'll need a Create Archive step for your iOS application to deploy it to TestFlight). When you're done with the workflow you are ready to start your first build.
A dedicated Virtual Machine is first created. After it the whole Workflow that you put together on the website is run on this machine.