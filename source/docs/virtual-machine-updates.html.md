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
this way you can install all the extra things you need for your builds
and other automation.

*You can find our OS X base box setup guide and automation scripts
in our [OS X Box Bootstrap repository](https://github.com/bitrise-io/osx-box-bootstrap),
so you can build your own virtual machine to match the ones used by Bitrise.*

The current Box OS X version is: **10.9.5 (Mavericks)**

Our current Base Box contains the following programs preinstalled:

* [Homebrew](http://brew.sh/)
* git
* mercurial
* openssl
* xctool
* go
* NodeJS
* wget
* Xcode 5 and Xcode 6 (for more information see the [Xcode version support guideline](/docs/xcode-version-support.html))
* [RVM](http://rvm.io/)
  * Ruby 2.1.2 and 2.1.3 installed, 2.1.3 is set as default
  * [CocoaPods](http://cocoapods.org/) installed for the default Ruby version
  
*We have a special Step which reports all the installed program/compontent versions.
Just add the **OS X System Information Reporter** step
to your app's workflow (or you can create a separate app on Bitrise
for testing), run a build and check this step's output.*

## Update Frequency

We tend to update our base Virtual Machine images (boxes) frequently
in case a major component gets updated (for example when
a new Xcode version is available).

The box update includes updates for the listed programs and for the OS
and is usually performed during the weekend to not to interfere
with your everyday business.

Updates are always announced on our [blog](http://blog.bitrise.io/)
and can be seen on the *Dashboard*
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

## Last update

The base box on the Bitrise worker servers were last
updated at **Sept. 30, 2014**.

## Next planned update

We plan to update our base box at **Nov. 1, 2014**
You can find more information about the proposed update
on [our blog](http://blog.bitrise.io/2014/10/27/scheduled-virtual-machine-box-update.html).
