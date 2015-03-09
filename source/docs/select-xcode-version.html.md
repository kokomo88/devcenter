---
title: Select the Xcode version for the build
---

# Which Xcode versions are available?

You can select a pre-installed Xcode version for the build
by specifying the version's *stability channel id*.

For example the `-stable` channel refers to the latest stable release version of Xcode which is pre-installed on the Virtual Machine. Similarly the `-beta` channel refers to the latest beta version of Xcode pre-installed on the Virtual Machine.

For available *version channel identifiers* and exact version numbers see the **Virtual Machine pre-installed tools** article on our [DevCenter](http://devcenter.bitrise.io/docs/virtual-machine-updates.html#technical-notes).


# How to select an Xcode version for the build?

Technically to activate an Xcode version you have to
call the Xcode command line tool `sudo xcode-select --switch /path/to/Xcode.app`.

You can do this with a *Bash Script* yourself or use
our [Select Xcode version Step](https://github.com/bitrise-io/steps-select-xcode-version){:target="_blank"}. This Step is available in the
Bitrise Verified Steps collection, all you have to do is
go to your App's *Workflow* tab, activate the **Workflow Editor**
and add the **Select Xcode version** Step to the Workflow
and select the *version channel* you want to use
as the Step's *Xcode version channel ID* parameter.
