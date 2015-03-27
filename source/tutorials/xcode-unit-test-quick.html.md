---
title: Bitrise Unit Test Step With Quick
---

# Bitrise Xcode: Unit Test Step With Quick

As described in the [Unit Test section](/tutorials/xcode-unit-test.html) you can simply run the unit tests you created for your project during every or branch specific builds on Bitrise just by adding the ***Xcode: Unit Test*** step to your workflow. 

Running unit tests that were created using [Quick](https://github.com/Quick/Quick) is not much more complex. Also check out the [Quick Documentation](https://github.com/Quick/Quick/tree/master/Documentation) page for a setup guide on your local machine.

[Quick](https://github.com/Quick/Quick) can be installed using CocoaPods and after installing it you can simply run the tests you created the same way as before.

>Remember to add Quick - *and Nimble (for the expect(...).to assertion syntax)*

    target 'MyTests' do
        use_frameworks!
        pod 'Quick'
        pod 'Nimble'
    end

This means you simply have to add the ***Run CocoaPods install*** step [https://github.com/bitrise-io/steps-cocoapods-and-repository-validator](https://github.com/bitrise-io/steps-cocoapods-and-repository-validator) and after that step you can run the ***Xcode: Unit Test*** to run your [Quick](https://github.com/Quick/Quick) based tests.

Just like at the ***Xcode: Unit Test*** step if there were no errors during the test the Formatted Output will show the following message:
    
    Success

If there were errors the following message is added to the Formatted Output:
    
    Error 
    Error Description:
    Xcode 'unittest' Action Failed
    See the logs for more information
    

There is a simple test project available at [https://github.com/bitrise-io/sample-apps-ios-unit-and-other-tests](https://github.com/bitrise-io/sample-apps-ios-unit-and-other-tests) You can simply try by adding the app and adding the ***Xcode: Unit Test*** step [https://github.com/bitrise-io/steps-xcode-builder](https://github.com/bitrise-io/steps-xcode-builder) and one of the CocoaPods install steps [https://github.com/bitrise-io/steps-cocoapods-and-repository-validator](https://github.com/bitrise-io/steps-cocoapods-and-repository-validator)