---
title: Bitrise Unit Test Step With Specta
---

# Bitrise Xcode: Unit Test Step With Specta

As described in the [Unit Test section](/tutorials/xcode-unit-test.html) you can simply run the unit tests you created for your project during every or branch specific builds on Bitrise just by adding the ***Xcode: Unit Test*** step to your workflow. 

Running unit tests that were created using [Specta](https://github.com/specta/specta) is not much more complex.

[Specta](https://github.com/specta/specta) can be installed using CocoaPods and after installing it you can simply run the tests you created the same way as before.

>Remember to add Specta - and the other pods you would like to use

    target :MyAppTests do
        pod 'Specta', '~> 0.4'
        # pod 'Expecta',     '~> 0.3'   # expecta matchers
        # pod 'OCMock',      '~> 2.2'   # OCMock
        # pod 'OCHamcrest',  '~> 3.0'   # hamcrest matchers
        # pod 'OCMockito',   '~> 1.0'   # OCMock
        # pod 'LRMocky',     '~> 0.9'   # LRMocky
    end

This means you simply have to add the ***Run CocoaPods install*** step [https://github.com/bitrise-io/steps-cocoapods-and-repository-validator](https://github.com/bitrise-io/steps-cocoapods-and-repository-validator) and after that step you can run the ***Xcode: Unit Test*** to run your [Specta](https://github.com/specta/specta) based tests.

Just like at the ***Xcode: Unit Test*** step if there were no errors during the test the Formatted Output will show the following message:
    
    Success

If there were errors the following message is added to the Formatted Output:
    
    Error 
    Error Description:
    Xcode 'unittest' Action Failed
    See the logs for more information
    

There is a simple test project available at [https://github.com/bitrise-io/sample-apps-ios-unit-and-other-tests](https://github.com/bitrise-io/sample-apps-ios-unit-and-other-tests) You can simply try by adding the app and adding the ***Xcode: Unit Test*** step [https://github.com/bitrise-io/steps-xcode-builder](https://github.com/bitrise-io/steps-xcode-builder) and one of the CocoaPods install steps [https://github.com/bitrise-io/steps-cocoapods-and-repository-validator](https://github.com/bitrise-io/steps-cocoapods-and-repository-validator)