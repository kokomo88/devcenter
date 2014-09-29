---
title: Step Development
---


# What is a Step?

A Step is an **open source** script repository which you can inspect and modify.

During the building process these scripts will be downloaded and executed
in the order you define in your Workflow, with the input parameters
you define in your Workflow.


# About the Step repository format

The step repository format is described at
the [StepLib project](https://github.com/steplib/steplib/tree/master/docs).

> Bitrise is under revision at the moment and our aim is to
> switch to the *open source* [StepLib project](https://github.com/steplib/steplib/tree/master/docs)
> in the near future so you can develop, test, publish and use your step scripts
> with the help of the open source community.


# Step Versioning

We advise to use "gitflow" (a really great
cheat-sheet: [http://danielkummer.github.io/git-flow-cheatsheet/](http://danielkummer.github.io/git-flow-cheatsheet/)) for your steps.

When a user adds your Step to a Workflow it will lock
the Step's version in the Workflow - no auto updates possible.
The user will have to manually update the Step’s version
in the Workflow to use a newer version.

As a general version number rule we suggest you to use the
three digit (1.0.0), Semantic Versioning : [http://semver.org/](http://semver.org/)

Neither is enforced at the moment and so it's not required but
these are the best practices we use and the ones we provide long term support for.


# Environment Variables

Every step's input is stored in environment variables the step defines.

You can also use the Bitrise provided *Default Environment Variables*
and the ones defined by previously executed steps.


# Step Pipeline

During the building process the steps defined in the Workflow are downloaded and executed
in the order you define in your Workflow, with the input parameters
you define in your Workflow.

Steps can export environment variables which can be used by the
subsequent steps.


# How to debug your Step

You can use our [Step Tester and Validator](https://github.com/bitrise-io/steps-step-tester-and-validator)
step - just add it to a test workflow.

You can of course run your step locally or in a Virtual Machine which
matches the one Bitrise uses ([Virtual Machines and Base Box updates](/docs/virtual-machine-updates.html))

# Best Practice

Include all your dependencies if possible.
This will make your Step more stable (the code checked into your
repository won't change unless you want to) and faster
(no recursive repository fetching required).
