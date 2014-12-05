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
which would be beneficial for everyone to be
pre-installed [let us know](http://www.bitrise.io/contact){:target="_blank"}!


## Pre-installed component versions

The current Box OS X version is: **10.9.5 (Mavericks)**

Our current Base Box contains the following programs preinstalled:

* [Homebrew](http://brew.sh/){:target="_blank"}: 0.9.5
* git: 2.1.3
* mercurial: 3.1.2
* xctool: 0.2.1
* go: 1.3.3
* NodeJS: 0.10.33
* NPM: 2.1.6
* wget: 1.16
* Xcode 5.1.1 (Build version 5B1008) and Xcode 6.1 (Build version 6A1052d) - for more information see the [Xcode version support guideline](/docs/xcode-version-support.html){:target="_blank"}
* [RVM](http://rvm.io/){:target="_blank"}: 1.26.0
  * Ruby 2.1.2, 2.1.3, 2.1.4 installed, 2.1.4 is set as default
  * [CocoaPods](http://cocoapods.org/){:target="_blank"} installed for the default Ruby version: 0.34.4
  
> You can find the OS X base box setup guide and automation scripts
> we use for building our OS X virtual machine base box
> in our [OS X Box Bootstrap repository](https://github.com/bitrise-io/osx-box-bootstrap){:target="_blank"},
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

Updates are always announced on our [blog](http://blog.bitrise.io/){:target="_blank"}
and can be seen on [your Bitrise Dashboard](http://www.bitrise.io/dashboard){:target="_blank"}
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
* We'll pre-install [ansible](http://www.ansible.com/home){:target="_blank"} for easier environment setup; version: 1.8.1
* We'll pre-install [nomad-cli](http://nomad-cli.com/){:target="_blank"} for easier Xcode provisioning profile management; version: 2.4.3
* We'll pre-install Ruby 2.1.5 with RVM and set as default
  * this also means that Cocoapods will be installed with this Ruby version (2.1.5)
* OS X version upgrade: from Mavericks (10.9) to Yosemite (10.10)
* git upgrade to: 2.2.0
* Mercurial upgrade to: 3.2.1
* NPM upgrade to: 2.1.10
* RVM upgrade to: 1.26.3
* Cocoapods upgrade to: 0.35.0
* **Xcode 5 will be removed**
* **Xcode 6 upgrade** to: Xcode 6.1.1 (Build version 6A2008a)


## Last update

The base box on the Bitrise worker servers were last
updated at **Nov. 1, 2014**.


## Next planned update

The new virtual machine with the changes described in the **Planned changes** section
is planned to be released at **Dec. 13, 2014**.

As usual we'll announce every scheduled virtual machine update
in our [blog](http://blog.bitrise.io/){:target="_blank"} which is also
shown on your [dashboard](http://www.bitrise.io/dashboard){:target="_blank"}.

> If you need older versions of a program or you know about a useful tool
> which would be beneficial for everyone to be
> pre-installed [let us know](http://www.bitrise.io/contact){:target="_blank"}!
