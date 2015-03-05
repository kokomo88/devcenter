# How Bitrise Works

## What is a Build? And what's this Workflow thing?

The Build is the process specified by the app's Workflow, a collection of Step scripts.
Every Step is an **open source** script repository which you can inspect and modify.

During the building process these scripts will be downloaded and executed
in the order you define in your Workflow, with the input parameters
you define in your Workflow.

## How does building work? What’s the build process?

1. First of all the build is triggered. This can happen in 3 ways:
  * pressing the "build" button on the application's page (run manually)
  * after each push to the given branch (run when push arrives)
  * with our [Trigger API](/docs/api/build-trigger-api.html)
2. If you reached your subscription plan's concurrent build count limit the build will be
    marked as *on hold*, and will start when your other builds finish
    and you have a free build slot.
    If you see **Waiting for a Worker** this means
    our system is hard at work to get a worker machine suitable for running your build.
3. Environment Preparations: once we find a suitable machine a Virtual Machine will be
    provisioned and prepared to run the build, build specific environment variables
    are set so you can use these in your steps - for example to
    [send a HipChat message with the build's detalis page url](/tutorials/hipchat-message.html).
4. The workflow steps are executed in the same order as you
    define on the workflow page of your application,
    from top to bottom. *(You can also modify the order of the steps by dragging them)*
    For each Step the log it generates is displayed on the build's details page.
    If the step generates a formatted (markdown) output it will also be available
    on the build's details page.
5. After the execution of the build
    a summary of the build is created and stored on the Bitrise server
    and **the virtual machine gets rolled back to a predefined state**,
    erasing every file
    and every change your build made
    so your code won't fall into the wrong hands.


## Feedback

We would really love to hear what
you think about Bitrise. On every Bitrise page you can find
a ![Feedback](images/how-bitrise-works/feedback.png "Feedback"){: .inline-image } icon
in the lower right corner where you can send us a message even with a screenshot.  

![Feedback](images/how-bitrise-works/feedback-bubble.png "Feedback")

On the [DevCenter](/) and on the [Bitrise Blog](http://blog.bitrise.io/)
you can leave your comment at the bottom of the article pages.

Feel free to send us your ideas on how we could make Bitrise better
or if you find an issue while you use Bitrise.
