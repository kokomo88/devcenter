---
title: Bitrise App Deployment
---

# Over-the-air App distribution with Bitrise

Bitrise has an integrated App Deployment system
you can use for App and other build artifact file distribution.

With this you can distribute your iOS App over the air
for your testers (*even for those who don't have a Bitrise account*)
or you can just use it for archiving your App and other
build artifact files.


## How does it work?

If you want to distribute your iOS App through Bitrise
all you need is an `Xcode Archive` and a `Bitrise iOS App Deployment`
step in your App's Workflow.

![Workflow with Bitrise iOS App Deployment step](images/bitrise-app-deployment/workflow-with-bitrise-ios-app-deployment-step.png "Workflow with Bitrise iOS App Deployment step"){: .inline-image }

The Xcode Archive step will create
the App's installable .ipa file and export it's path
so that other deployment steps can find it automatically.

If the .ipa is available the Bitrise iOS App Deployment
step will upload it for the Build and it will be listed
on the Build's details page.

![Apps section on Build Details page](images/bitrise-app-deployment/build-page-apps-section.png "Apps section on Build Details page"){: .inline-image }

For each deployed iOS Apps you'll see an information and
notifications card where you can check the details of
the App (title, bundle id, version number, size, etc.)
and you can download the App's .ipa file if you're
not on an iOS device.

If you built your iOS App with a Development or Ad-Hock
Provisioning Profile an additional section will be
presented with a list of allowed device identifiers (UDID).

If you or a team member of your App's team
register a device for her Bitrise account
(you can do this on your [Account Settings page](https://www.bitrise.io/me/profile){:target="_blank"}
at the *Test Devices* section) and the device's identifier can be found
in the Provisioning Profile then instead of just
presenting the identifier in the list you'll see
the user who registered the device and the device's
name.

If you visit the Build page from an iOS device (which
you registered for your account) you'll see an *Install*
button instead of the *Download* button. With this
**you can install the App on your device directly from Bitrise**.


## Public App install page

If you enable the *Public install page* option for the App
then a long and random URL will be available for you
which you can send even to people who are not registered on Bitrise.

Opening this link you'll see a base description of the App
(title, version, size, supported devices) and an *Install*
button if you visit the page from an iOS device.

![Public App install page](images/bitrise-app-deployment/public-install-page.png "Public App install page"){: .inline-image }

You can share this page with anyone even if they don't have
a Bitrise account, but you have to make it sure that
they'll actually be able to install it - **if you don't
use an Enterprise Provisioning Profile to build your App
you have to add every device identifier (UDID) to the Provisioning
Profile, the App can't be installed on any other device**.

You can enable or disable the App's public install page
any time from the related Build page and **you can also set
the default state** (enabled or disabled) **in your App's Workflow**
(select the Bitrise iOS App Deployment step and set the
`Enable public page for the App?` to *no* if you don't want
to automatically enable this feature).

***If you disable the Public install page for the App
then only your App's team members will be able to install the App
from Bitrise!***


## Notifications and install invites

On the Build's page you can send install invites
for your testers. You can either send invites for
a group of your team (testers, developers, admins or owner)
or (if the *Public install page* option is enabled) you can
send install invites to any email address.

*Keep in mind that the install invite email contains the
URL of the Public install page. If you invite someone
who's not in your App's team and then disable the Public install
page they won't be able to access the install page! Those
who are in your App's team will be redirected to the Build's
page if the Public install page is disabled.*

**You can specify the list of groups and emails
for automatic install invite notification** in the App's Workflow.
Similarly to the Public page option just select
the *Bitrise iOS App Deployment* step in your Workflow
and specify the list of groups and emails to
automatically notify at the `Notify: User Groups` and `Notify: Emails` options.

Keep in mind that if you disable the *Public install page*
option Bitrise won't send install invite emails for
the emails you specify because in this case only your
team members can access the App.
