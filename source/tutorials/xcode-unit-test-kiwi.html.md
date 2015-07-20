---
title: Bitrise Unit Test Step With Kiwi
---

# Bitrise Xcode: Unit Test Step With Kiwi

As described in the [Unit Test section](/tutorials/xcode-unit-test.html) you can simply run the unit tests you created for your project during every or branch specific builds on Bitrise just by adding the ***Xcode: Unit Test*** step to your workflow. 

Running unit tests that were created using [Kiwi](https://github.com/kiwi-bdd/Kiwi) is not much more complex. Also check out the [Kiwi Getting Started](https://github.com/kiwi-bdd/Kiwi/wiki/Getting-Started-with-Kiwi-2.0) page for a setup guide on your local machine.

[Kiwi](https://github.com/kiwi-bdd/Kiwi) can be installed using CocoaPods and after installing it you can simply run the tests you created the same way as before.

>Remember to set the target for the pod in your podfile 

    target :SuchAppTests, :exclusive => true do
    	pod 'Kiwi'
    end

>or link the original and test targets so the tests can use the framework

    link_with 'SuchApp', 'SuchAppTests'
    pod 'Kiwi'

This means you simply have to add the ***Run CocoaPods install*** step [https://github.com/bitrise-io/steps-cocoapods-and-repository-validator](https://github.com/bitrise-io/steps-cocoapods-and-repository-validator) and after that step you can run the ***Xcode: Unit Test*** to run your [Kiwi](https://github.com/kiwi-bdd/Kiwi) based tests.

Just like at the ***Xcode: Unit Test*** step if there were no errors during the test the Formatted Output will show the following message:
    
    Success

If there were errors the following message is added to the Formatted Output:
    
    Error 
    Error Description:
    Xcode 'unittest' Action Failed
    See the logs for more information
    

There is a simple test project available at [https://github.com/bazscsa/kiwi-test-project](https://github.com/bazscsa/kiwi-test-project) You can simply try by adding the app and adding the ***Xcode: Unit Test*** step [https://github.com/bitrise-io/steps-xcode-builder](https://github.com/bitrise-io/steps-xcode-builder) and one of the CocoaPods install steps [https://github.com/bitrise-io/steps-cocoapods-and-repository-validator](https://github.com/bitrise-io/steps-cocoapods-and-repository-validator)teps-cocoapods-and-repository-validator)