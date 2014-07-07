---
title: The Build Process
---


# What is a "Build"?

The Build is the process specified by the app's Workflow, a collection of Step scripts. Every Step is a script repository which you can inspect and modify.

During the building process these scripts will be downloaded and executed in the order you define in your Workflow.

# How it works?

The stages of a Build:

1. Build is triggered, either manually of automatically
2. If you reached your subscription plan's limit the build will be marked as "on hold", and will start immediately when it can. The most likely reason is that you have the maximum amount of builds running (based on your subscription) - in this case the next build will start when one of the running builds finishes.
3. Waiting for a Worker: our system is hard at work to get a worker machine suitable for running your build.
4. Environment Preparations: once we find a suitable machine a Virtual Machine will be provisioned and prepared to run the build.
5. Building: After the Environment preparations your build is ready to run - will be executed step by step, as defined by the build's Workflow.
6. Finishing: Once the last Step finishes a summary of the build is created and stored on the server, and the Virtual Machine is discarded so your code won't fall into the wrong hands.
