---
title: Frequent iOS issues
---

# Frequent iOS issues

## ld: library not found for -lPods-...

### Error

    ld: library not found for -lPods-...
    clang: error: linker command failed with exit code 1 (use -v to see invocation)

### Solution

Most likely you use Cocoapods but you specified the Xcode project (.xcodeproj) file instead of the Workspace (.xcworkspace) file. Go to your App's **Settings tab** on Bitrise and change the *Project File Path*.

If still fails check your App's Workflow Environments - the project file path
might be overwritten by a Workflow environment variable.


## No dSYM found

A couple of services require the dSYM to be present for deployment
but you might have disabled the dSYM generation in your Xcode project.

### Solution

To generate debug symbols (dSYM) go to your `Xcode Project's Settings -> Build Settings -> Debug Information Format` and set it to *DWARF with dSYM File*.


## Invalid IPA: get-task-allow values in the embedded.mobileprovision don't match your binary.

Solution: Generate a new Certificate on the Apple Developer portal, **not** in Xcode.

Another solution might be: Set the proper Signing Identity and Provisioning Profile in Xcode project settings
for both the target and for the project.


## Works in local but not on Bitrise

Error might be **ld: file not found** with no other error message to help:

    ld: file not found: /Users/vagrant/Library/Developer/Xcode/DerivedData/...
    clang: error: linker command failed with exit code 1 (use -v to see invocation)

### Solution

Delete Xcode local cache - the error should now be
reproducible on your local machine.

You can delete the local Xcode cache using your Terminal:

    rm -rf ~/Library/Developer/Xcode/DerivedData
