---
title: Step Development
---

# Step Development

## What is a Step?

A Step is an **open source** script repository which you can inspect and modify.

During the building process these scripts will be downloaded and executed
in the order you define in your Workflow, with the input parameters
you define in your Workflow.


## Create your own Step

You can find more information about how you can create
your own Step, and if you would like to submit it into
the [Open Step Library](http://www.steplib.com/){:target="_blank"}
at [https://github.com/steplib/steplib](https://github.com/steplib/steplib){:target="_blank"},
and a template repository at [https://github.com/steplib/step-template](https://github.com/steplib/step-template){:target="_blank"}.


## How to debug your Step

You can find information about how you can run your Step on your
own machine in the [step-template repository](https://github.com/steplib/step-template){:target="_blank"}.


### Test or use your Step on Bitrise

Once you're ready to test your Step on Bitrise you can
add it as a *Custom Step* to your Workflow. You can do this by:

1. Open your app on [Bitrise.io](https://www.bitrise.io/){:target="_blank"}
2. Click on the *Workflow* tab
3. Click on *Manage Workflows* to open the Workflow Editor
4. Click on the *plus sign* between two steps
5. Choose the *Custom Step* option
6. Copy-paste your Step's `step.yml` into the text field.
7. Click on *Add Custom Step* button.


### Test or use the fork of a Step or a cutting-edge / non published version

In case you want to test a Step which is already available in a supported
Step Library on [Bitrise](https://www.bitrise.io/){:target="_blank"} (this
means that you can select and add the Step to your Workflow
without adding it as a *Custom Step*) you can of course follow the
previous section and add it as a *Custom Step*, but in this case you
can use an easier method as well:

1. Add an existing version of the Step to your Workflow, from one of the supported Step Libraries
2. Export the Workflow on [Bitrise](https://www.bitrise.io/){:target="_blank"} *(click on show more and select an Export Workflow option)*
3. In the exported Workflow go to the Step you want to modify
4. Change the parameters of the step the way you want to
5. Import it back on [Bitrise](https://www.bitrise.io/){:target="_blank"}

**Change only the version**: if all you want to do is to change the
version of the Step you can simply change the value of the `version_tag` property.
This can be either a *git tag* or a *git branch* name.
This is useful if you want to use a cutting-edge or non published version of the Step.
You can use the *master* branch version of the Step for example by setting: `version_tag: master` (if you exported your Workflow in YML).

**Switch to your own fork of the Step**: if you want to use your own forked
version of the step you have to change two things:

1. Change the *version_tag* as described above (usually to `version_tag: master`)
2. Additionally change the repository's git url at the `source > git` property to your fork's url. Example: `git: https://github.com/myuser/my-step-fork.git`
3. Optionally you might want to change the `steplib_source` property as well. If you don't change this then Bitrise will still try to link the Step to it's original source, and it'll always be marked as *update available*. You can change this property to anything, for example to `steplib_source: _custom` to stop this.


## Best Practices

Include all your dependencies if possible.
This will make your Step more stable (the code checked into your
repository won't change unless you want to) and faster
(no recursive repository fetching required).
