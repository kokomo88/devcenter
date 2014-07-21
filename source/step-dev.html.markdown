---
title: Step Development
---


# What is a Step?

To put it short and simple: a Step is a public script repository with step.sh file.

Steps are the main building blocks to a workflow. The script can clone repositories, gather system information of the Virtual Machine, send emails and so much more.


# How to develop Steps

Create the public repository for the step and make sure the step.sh file is included. This file is executed by Bitrise. Create a test workflow for every Step you develop.




# Step Versioning

We advise to use “gitflow” (a really great cheat-sheet: [http://danielkummer.github.io/git-flow-cheatsheet/](http://danielkummer.github.io/git-flow-cheatsheet/)) for your steps.

When a user adds your Step to a Workflow it will lock the Step’s version in the Workflow - no auto updates possible. The user will have to manually update the Step’s version in the Workflow to use a newer version.

As a general version number rule we suggest you to use the three digit (1.0.0), Semantic Versioning : [http://semver.org/](http://semver.org/)

Neither is enforced at the moment and so it’s not required but these are the best practices we use and the ones we provide long term support for.


# Environment Variables

TODO:

- Default Environment Variables
- Step Outputs


# Step Pipeing

TODO


# How to debug your Step

TODO

# Best Practice

Include all your dependencies if possible. This will make your Step more secure (the code checked into your repository won't change unless you want to) and faster (no recursive repository fetching required).

TODO
