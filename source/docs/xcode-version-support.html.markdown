---
title: Xcode version support
---

# Important note

These are our general Xcode version support / upgrade guidelines.

**If you need an older version of Xcode to be preinstalled on the OS X VMs let us know**,
we're open to discuss it and keep the support if it's reasonable.


# Xcode version support guideline

We have the last two major versions of Xcode preinstalled in the OS X Virtual Machines - as of writing: Xcode 5 and 6.

Minor version support:

For both major versions the Virtual Machines contains the latest minor versions which are officially supported by Apple to build apps for App Store submissions.

This means that in the OS X Virtual Machine (base box) two versions of Xcode are pre-installed:

*As of writing:*

* Xcode 6.0 (GM)
* Xcode 5.1


# Xcode Beta version support

When the next Xcode major version's first Beta is available we'll remove the oldest major version
and instead install the new major version's beta versions until the first official version comes out.

The next Xcode beta version will be Xcode 7's first beta.
When it'll be available we'll remove Xcode 5 from our VMs and start to include Xcode 7's beta versions
until the first non beta version is available (usually the GM version).

This means that a major version of Xcode is supported for about 2 years (with Apple's current update schedule).


# iOS Simulator version support

All the iOS Simulator versions which can be installed
through *Xcode -> Preferences -> Downloads* are installed and available.


# xctool support

We try to always include the latest version of [xctool](https://github.com/facebook/xctool)
in our OS X VMs.

xctool is installed through [homebrew](http://brew.sh/) and so if you need to update it
to be sure you have the latest version you can add a [Bash Script Step](https://github.com/bitrise-io/steps-bash-script)
with the content:


    #!/bin/bash
    brew update
    brew upgrade xctool

## xctool Xcode 6 support

Right now xctool doesn't support Xcode 6 in it's latest release version.
We'll [keep an eye](https://github.com/facebook/xctool/issues/380) on this issue
and we'll update the preinstalled xctool in our VMs when the new release gets available.
