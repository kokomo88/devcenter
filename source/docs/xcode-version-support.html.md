---
title: Xcode version support
---

# Important note

These are our general Xcode version support / upgrade guidelines.

**This is a guideline, not a rule documentation. If you need an older version of Xcode to be preinstalled on the OS X VMs let us know**,
we're open to discuss it and keep the support if it's reasonable.


## Xcode version support guideline

We have the latest major, stable version of Xcode pre-installed in the OS X Virtual Machines.

When a new major version of Xcode gets released we keep supporting the previous major version until the first significant patch version of Xcode.

For example: with Apple's versioning the major version is Xcode 6 and the first significant patch is Xcode 6.1 and we kept Xcode 5 installed on the Virtual Machines before Xcode 6.1 was released.

Minor version support:

For all major versions the Virtual Machines contains the latest minor versions which are officially supported by Apple to build apps for App Store submissions.

As of writing the following Xcode versions are installed on the builder virtual machines:

* Xcode 6.1 (Build version 6A1052d)
* Xcode 5.1.1 (Build version 5B1008) - *planned to be removed in the next virtual machine update*


## Xcode update schedule

The pre-installed Xcodes are updated as part of our Virtual Machine base box updates, you can read more about the update schedule [here](/docs/virtual-machine-updates.html)).


## Xcode Beta version support

When the next Xcode major version's first Beta will be available we'll start supporting the new major version's beta versions until the first official, stable version comes out.

*Only the latest beta version is supported.*


## iOS Simulator version support

All the iOS Simulator versions which can be installed
through *Xcode -> Preferences -> Downloads* are installed and available.


## xctool support

We try to always include the latest version of [xctool](https://github.com/facebook/xctool)
in our OS X VMs.


## xctool support

The latest [xctool](https://github.com/facebook/xctool) version ([0.2.1](https://github.com/facebook/xctool/releases/tag/v0.2.1)) has major unit testing issues with our dual Xcode setup.

This is a [know](https://github.com/facebook/xctool/issues/380){:target="_blank"}
[issue](https://github.com/facebook/xctool/issues/431){:target="_blank"},
and we plan to solve it by removing the pre-installed xctool from our virtual machines
and instead support the installation of xctool as part of
our Xcode builder steps or as a new, separate step unless this bug gets fixed.

The proposed fix right now is to add a **Bash Script Runner** step
to your workflow, right before your Xcode build, analyze, unit test or archive step
with the following content:

    #!/bin/bash
    brew update && brew uninstall xctool && brew install xctool --build-from-source

Be advised this can be a time consuming step (~ 100 seconds)
and because you usually don't need the
nicely formatted logs for your unit tests you can just use the default
*xcodebuild* builder instead of xctool for your unit tests.

At the moment xctool is pre-installed on the virtual machines and is installed through [homebrew](http://brew.sh/) and so if you need to update it
to be sure you have the latest version you can add a [Bash Script Step](https://github.com/bitrise-io/steps-bash-script)
with the content:

    #!/bin/bash
    brew update && brew upgrade xctool


## Technical details

We install our Xcodes into a /Applications/Xcodes folder with the Xcode app's major version as a postfix.

For example the current Xcode 6 version is available at: */Applications/Xcodes/Xcode6.app*


## List preinstalled Xcodes and get version information

If you want to list all the preinstalled Xcode versions you can drop
a [Bash Script Step](https://github.com/bitrise-io/steps-bash-script) into your
workflow with the content:

    #!/bin/bash
    FILES=/Applications/Xcodes/Xcode*.app
    for f in $FILES
    do
        echo "--------------"
        echo "Switching to Xcode at: ${f}"
        xcode_switch_arg="${f}/Contents/Developer"
        sudo xcode-select --switch "${xcode_switch_arg}"
        echo " Version info:"
        xcodebuild -version
        echo " SDKs:"
        xcodebuild -showsdks
        echo "--------------"
    done

This will find all the Xcode apps in the /Applications/Xcodes folder,
activate each by calling xcode-select and print the version of Xcode
and all the SDKs (and Simulators) available for the version.
