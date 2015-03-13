---
title: Bitrise Unit Test Step
---

# Bitrise Xcode: Unit Test Step

You can run the unit tests you created for your project during every or branch specific builds on Bitrise.

There is an ***Xcode: Unit Test*** step (you can view the step on Github [https://github.com/bitrise-io/steps-xcode-builder](https://github.com/bitrise-io/steps-xcode-builder)) in the verified step library. You have to add this step to your workflow and it will run your tests from the cloned repository. If there were no errors during the test the Formatted Output will show the following message:
    
    Success

If there were errors the following message is added to the Formatted Output:
    
    Error 
    Error Description:
    Xcode 'unittest' Action Failed
    See the logs for more information


Keep in mind that the step works with the previously cloned repository so in the workflow process it needs to be after the clone step.

For plain unit tests created in Xcode there are no other things to do. Add the tests to the repository, add the step to your workflow, start the build and Bitrise will run your unit tests for you.

If you'd like to use [Kiwi](https://github.com/kiwi-bdd/Kiwi) framework to write and run your tests follow [Kiwi BDD unit tests with Bitrise](/tutorials/xcode-unit-test-kiwi.html) tutorial (don't worry it won't be much longer)

If you'd like to use [Kif](https://github.com/kif-framework/KIF) framework to write and run your tests follow [KIF functional testing with Bitrise](/tutorials/xcode-unit-test-kif.html) tutorial (don't worry it won't be much longer)