---
title: Virtualization Solution - OS X
---

Bitrise's builder depends on Virtualization - every build runs in its own, clean Virtual Machine.
After a build is finished the Virtual Machine is restored to a predefined state.

You can see all the scripts we use to prepare our base virtual machine images / boxes in our [osx-box-bootstrap GitHub repository](https://github.com/bitrise-io/osx-box-bootstrap).
By following the guide and using the scripts provided in the repository you can create
your own virtual machine which will be identical to the ones used for Bitrise!


# What Virtualization tools are used for Bitrise?

At the moment we use custom built *Parallels Desktop* virtual machines. 

We install and prepare our OS X virtual machines without using any template or base virtual machine image / box. You can find all the instructions we use for preparing these virtual machine boxes in
our [osx-box-bootstrap GitHub repository](https://github.com/bitrise-io/osx-box-bootstrap).

We use [vagrant](https://www.vagrantup.com/) for managing our virtual machines for the following reasons:

* vagrant has a well defined interface which means we can experiment with different
	virtual machine providers / hypervisors and use (almost) the same interface for
	distribution and management.
* vagrant has great plugins to extend it's interface, we use the excellent [vagrant-sahara](https://github.com/jedi4ever/sahara) plugin to manage our virtual machine snapshots.
* it's an active open source project with an amazing community behind it.
* we don't use any prebuilt vagrant boxes, we tightly control the security of our VMs
* vagrant is only used for managing the virtual machines, once the virtual machine is running
	we communicate with it directly through SSH and we replace the authorized insecure SSH key
	which is required by vagrant with our own once the virtual machine is ready for a new build.
	This way we can control the security of our boxes and still use vagrant's interface
	for management.


## Experiments


## VirtualBox

We're constantly looking for improving our infrastructure including our build virtual machines.

We had networking and stability issues with Parallels Desktop and we're planning to
switch to [VirtualBox](https://www.virtualbox.org/) in the near future.

The performance of VirtualBox is not as good as Parallels' but it proved to be more
stable with our constant virtual machine snapshot rollbacks and we always try to
use established and stable open source projects as part of our infrastructure.


## KVM/QEMU

We're also testing virtual machines running under QEMU.

At the moment it seems like a promising near future alternative but a few hacks are
still required. This is something we can't afford as we try to provide a stable
environment for building.

Once these issues are resolved we'll perform more tests to determine
the viability of a KVM/QEMU based solution.


## VMware ESXi

We have plans to test an ESXi based virtual machine system as well, but so far
we haven't spent much time with it.
