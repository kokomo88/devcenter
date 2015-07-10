# What is Bitrise and what can you do with it?

In short Bitrise is a Continous Integration and Delivery (CI/CD)
Platform as a Service (PaaS) with a main focus on mobile
app development (iOS, Android).

You can automate the testing and deployment of
your apps with just a few clicks.

When you trigger a build a Virtual Machine is assigned to
host your build and your defined Workflow (series of Steps scripts) will
be executed, step by step.

A workflow consists of one or more steps which are open source git repositories
with scripts that can be imported into Bitrise
(you can develop your own steps - see our [tutorial on step development](/docs/step-dev.html)).

The steps can do anything what you can implement with scripts: send emails,
text messages, pass values to each other, create XCode archives,
publish to TestFlight, notify other Users or even gather system
information about the VirtualMachine running the build and many more.
You can read more at [How Bitrise Works](/docs/how-bitrise-works.html).

After a build is finished the Virtual Machine is discarded and
you can browse the logs of every step that ran during the workflow.
You can read more at [Code Security](/docs/code-security.html).
