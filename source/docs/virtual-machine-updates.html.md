---
title: Virtual Machines and Base Box updates
---

# Base Box

The Base Box is a virtual machine image we use for running your builds.
Every build runs in its own virtual machine and the virtual machine is
rolled back to a saved state (the base box state) after the build finishes.

This way **your builds are always protected** by changes made by others and
by your previous builds, you can use a **stable environment** to
define your build workflow (no state persists between builds).

The user which is used for the builds is configured with **passwordless sudo** enabled,
this way **you can install all the extra things you need for your builds**
and for other automation.

**This is a guideline, not a rule documentation.**
If you need older versions of a program or you know about a useful tool
which would be beneficial for everyone to be pre-installed let us know,
we're open to discuss it.


## Pre-installed component versions

The current Box OS X version is: **10.9.5 (Mavericks)**

Our current Base Box contains the following programs preinstalled:

* [Homebrew](http://brew.sh/): 0.9.5
* git: 2.1.3
* mercurial: 3.1.2
* xctool: 0.2.1 *NOTE: we'll remove xctool in our next box update and will support it through Steps. You can read more about it in our [Xcode version support guideline](/docs/xcode-version-support.html)*
* go: 1.3.3
* NodeJS: 0.10.33
* NPM: 2.1.6
* wget: 1.16
* Xcode 5.1.1 (Build version 5B1008) and Xcode 6.1 (Build version 6A1052d) - for more information see the [Xcode version support guideline](/docs/xcode-version-support.html)
* [RVM](http://rvm.io/): 1.26.0
  * Ruby 2.1.2, 2.1.3, 2.1.4 installed, 2.1.4 is set as default
  * [CocoaPods](http://cocoapods.org/) installed for the default Ruby version: 0.34.4
  
> You can find the OS X base box setup guide and automation scripts
> we use for building our OS X virtual machine base box
> in our [OS X Box Bootstrap repository](https://github.com/bitrise-io/osx-box-bootstrap),
> so you can build your own virtual machine to match the ones used on Bitrise.*
  
*We have a special Step which reports all the installed program / component versions.
Just add the **OS X System Information Reporter** step
to your app's workflow (or you can create a separate app on Bitrise
for this purpose), run a build and check this step's output.*


## Update Frequency

We tend to update our base Virtual Machine images (boxes) frequently
in case of a major component gets updated (for example when
a new Xcode version is available).

The box update includes the latest updates for the listed programs and for the OS
and is usually performed during the weekend to not to interfere
with your everyday business.

Updates are always announced on our [blog](http://blog.bitrise.io/)
and can be seen on [your Bitrise Dashboard](http://www.bitrise.io/dashboard)
at least a week before the update.


### Minor updates

Additional smaller box patches are performed periodically to
keep the base system up-to-date.

These patches include:

* important program updates (for example xctool was not compatible with
  Xcode 6 when the first official Xcode 6 version was published,
  we issued a box patch to update xctool when the Xcode 6 support arrived)
* CococaPods, Homebrew and other dependency manager *database* updates
  to make it faster for you to install dependencies or switch versions
  of dependencies.


## Planned changes

* We plan to remove Xcode 5 in our next virtual machine update
* We might remove xctool, as described in our [Xcode version support guideline](/docs/xcode-version-support.html)


## Last update

The base box on the Bitrise worker servers were last
updated at **Nov. 1, 2014**.


## Next planned update

We don't have plans for updating our virtual machines until
a core component changes (for example a new Xcode version gets released).

As usual we'll announce every scheduled virtual machine update
in our [blog](http://blog.bitrise.io/) which is also
shown on your [dashboard](http://www.bitrise.io/dashboard).
