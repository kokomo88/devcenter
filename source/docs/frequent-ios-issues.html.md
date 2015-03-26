---
title: Frequent iOS issues
---

# Frequent iOS issues


## Pod install fails at validation

Bitrise will try to `pod install` every *Podfile* it can find
in the repository you specify.

**Make sure:**

* If you have more than one Podfile in your repository make sure that all can be pod installed!
* Make sure that the Podfile is in the same directory as your Xcode project file (.xcodeproj).
* Bitrise will try to scan every active *branch* of your repository during the validation. If you have older / unused branches which also include a Podfile you should check those branches and Podfiles too, or remove the branches from your repository if you don't use them anymore.


## To use TestFlight Beta Testing, build X must contain the correct beta entitlement

**Error:**

You see this warning on iTunes Connect (`To use TestFlight Beta Testing, build X must contain the correct beta entitlement`) after a deploy from Bitrise
and you can't enable the version for prerelease beta testing.

**Solution:**

* Make sure you use an **App Store distribution** Provisioning Profile for building your app, you can't use development, ad-hock distribution or enterprise profile if you want to use the iTunes Connect beta testing service.
* Make sure your Provisioning Profile is up-to-date, you might even want to re-generate it as beta testing is only available for profiles generated after the introduction of the iTunes Connect beta testing service.

If you're sure your profile should work (if you can upload a beta
build directly from Xcode, and you can enable prerelease beta testing for it)
you might have to do one more thing.

Xcode generates a special **entitlements file** for beta testing
but does only if you upload the build directly from Xcode.

To force the generation of this file you have to add a .entitlements file
to your Xcode project.

The entitlements file is usually located in the target's folder, with the name **YOUR-TARGET-NAME.entitlements**. If your project does not include
this file you have to create it yourself. You can do it manually
or let Xcode generate one for you.

**Automatic setup**

Xcode can generate this file for you by going to your
`Project settings > Capabilities tab >` enable the *iCloud* option
or any other option from this page which requires special entitlements.
The .entitlements file will be generated and added to your projects automatically
and you can disable the capability option immediately (once you
see the .entitlements file added to the project).

**Manual setup**

Generate the .entitlements (plist) file with the name: **YOUR-TARGET-NAME.entitlements**
then **set in Xcode project settings**: in `Target > Build Settings` set the key **Code Signing Entitlements** (`CODE_SIGN_ENTITLEMENTS`) to the file's path (relative to the Xcode project file). It have to contain both the application-identifier and the beta-reports-active.

**Example entitlements file content**

*Note: both `application-identifier` and `beta-reports-active` key-value
pair have to be present in the entitlements file.*

    <?xml version="1.0" encoding="UTF-8"?>
    <!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
    <plist version="1.0">
    <dict>
      <key>application-identifier</key>
      <string>$(AppIdentifierPrefix)$(CFBundleIdentifier)</string>
      <key>beta-reports-active</key>
      <true/>
    </dict>
    </plist>

> Note: Every build which you want to push to iTunes Connect have to have a unique build and version number pair (increment either or both before a new deploy to iTunes Connect).


## Works in local but not on Bitrise

Error might be **ld: file not found**, the path contains *DerivedData*, with no other error message to help:

    ld: file not found: /Users/vagrant/Library/Developer/Xcode/DerivedData/...
    clang: error: linker command failed with exit code 1 (use -v to see invocation)

**Solution:**

Delete Xcode local cache - the error should now be
reproducible on your local machine.

You can delete the local Xcode cache using your Terminal:

    rm -rf ~/Library/Developer/Xcode/DerivedData


## ld: library not found for -lPods-...

**Error:**

    ld: library not found for -lPods-...
    clang: error: linker command failed with exit code 1 (use -v to see invocation)

**Solution:**

Most likely you use Cocoapods but you specified the Xcode project (.xcodeproj) file instead of the Workspace (.xcworkspace) file. Go to your App's **Settings tab** on Bitrise and change the *Project File Path*.

If still fails check your App's Workflow Environments - the project file path
might be overwritten by a Workflow environment variable.


## No dSYM found

A couple of services require the dSYM to be present for deployment
but you might have disabled the dSYM generation in your Xcode project.

**Solution:**

To generate debug symbols (dSYM) go to your `Xcode Project's Settings -> Build Settings -> Debug Information Format` and set it to *DWARF with dSYM File*.


## Invalid IPA: get-task-allow values in the embedded.mobileprovision don't match your binary.

**Solution:** Generate a new Certificate on the Apple Developer portal, **not** in Xcode.

Another solution might be: Set the proper Signing Identity and Provisioning Profile in Xcode project settings
for both the target and for the project.


## No identity found

You uploaded the correct *Provisioning Profile* and *Certificate* pair,
if you check the identity hash it matches with the one you can see
in your Keychain,
but you still get an error like:

    22...D11: no identity found

**Solution:**

You probably have a configuration in your Xcode project settings
which specifies which keychain should be used for the build,
your scheme might include something like `--keychain /../../xxx.keychain` code signing flag and a `CODE_SIGN_KEYCHAIN` variable set in the *.pbxproj*.

This might happen if you migrate your Xcode Bot based
setup into Bitrise.

To fix the issue you have to remove the keychain selection
configurations from your Xcode project settings because
Bitrise uses dynamic, temporary keychains for code signing.


## App built on Bitrise can't be installed on test devices

**Description:**

The app was built successfully on Bitrise and deployed with
either the Bitrise iOS App Deployment step or to a 3rd party
service like HockeyApp, but it can't be installed on real
test devices.

**Solution:**

The problem is most likely related to the *entitlements* file included in your
Xcode project (which is also included in the built .ipa iOS app file
after a successful build in the *embedded.mobileprovision* file inside the .ipa archive).

Make sure that all of the following items are included
in the *entitlements* Plist file:

* application-identifier
* get-task-allow
* keychain-access-groups

Additional required items if you build your app with an *Enterprise
Provisioning Profile*:

* com.apple.developer.team-identifier

***Note:*** Apps built with *App Store distribution Provisioning Profiles*
**can't be installed** on test devices, only through Apple's
iTunes Connect system!
