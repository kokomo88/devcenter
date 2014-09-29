---
title: Code Security
---


# Every Build runs in a Virtual Machine

To guarantee the security of your builds we use virtual machines for builds.
**Every build runs in it's own virtual machine and we restore the whole
virtual machine to a predefined state after the build finishes**, erasing
every file your build uses and every change you make during your build.

This way **your builds are always protected** by changes made by others'
and from your previous builds, no one else can access your code
and you can use a **stable environment** to
define your build workflow (no state persists between builds).

To read more about our Virtual Machines you can read our
[Virtual Machines and Base Box updates](/docs/virtual-machine-updates.html)
article.
