---
title: Build Trigger API
---

# Bitrise Build Trigger API

With the Build Trigger API you can start a new build of your app
with a simple API call.

You can define parameters for the build like what branch or tag to use
and what build message to present on the Build's details page.

With the Build Trigger API you can integrate your app's building
with your other services.

*You can find an interactive cURL call configurator on
your App's **Code tab**.*


## How to start a Build by calling the Trigger API?

You have to call your build trigger with a POST request containing a "payload" parameter
with a JSON string value.
You can either use a GitHub style hook payload or a BitBucket style
hook payload, or a custom Bitrise one.

*When you use the Bitrise Trigger API you have to specify this App's API Token. You can regenerate your App's API Token anytime you want.*

## BITRISE PAYLOAD

The JSON string has to contain:

* a "hook_info" object with a "type" key and "bitrise" as it's value
* a "hook_info" object with a "api_token" key and your API Token as it's value

## PARAMETERS

Additionally you can define build parameters if you call the Build Trigger URL
with the Bitrise style parameters. In this case you'll have to include an
additional build_params parameter in the payload (in addition to the hook_info parameter).

Supporter Build Parameters:

* tag
* commit_hash
* branch
* commit_message
* environments
* workflow_id

*If you provide a tag the branch parameter will be ignored. If you provide a commit_hash parameter then both the tag and the branch parameters will be ignored. These will still be logged and will be visible on the build details page but the git clone step will use the commit_hash for checkout in this case.*

## curl example

You can find a **curl configurator** on **your App's Code tab**.

A base curl call would look like this (with a 1.0.0 *tag* build parameter):

    $ curl https://www.bitrise.io/hook/[app-slug] --data-urlencode 'payload={"hook_info":{"type":"bitrise","api_token":"[app-api-token]"},"build_params":{"tag":"1.0.0"}}'



## Specify Environment Variables

You can define additional *environment variables* for your
build. These variables will be handled with the highest priority
which means that you can overwrite any other environment variable
specified in your Workflow.

### Here's how you can use it:

You can configure your build the same way as you did before - you can find a cURL call configurator on the Code tab of your app.

We extended the list of accepted `build_params` with a new item, an `environments` array. It's important that this parameter have to be an array, and that every item of the array have to include at least a `mapped_to` (the key of the Environment Variable, without a dollar sign ($)) and a `value` property (the value of the variable).

### Example

Let's say you want to build the "test" branch, specify a build message and set a test Environment Variable, then the call will look like this:

    curl https://www.bitrise.io/hook/xxx --data-urlencode 'payload={"hook_info":{"type":"bitrise","api_token":"xxx"},"build_params":{"branch":"test","commit_message":"Environment in API params test","environments":[{"mapped_to":"API_TEST_ENV","value":"This is the test value"}]}}'

*Note: this cURL command can be configured and generated
on your App's **Code tab**.*


## Specify the Workflow to be used for the build

By default the Workflow for your Build will be selected
based on the *branch* parameter. This works well if you
use Web-hooks to automatically build every code push
as you can define separate Workflows for separate branches.

With the Trigger API you can however overwrite this selection
and specify exactly which Workflow you want to use.

All you have to do is add a `workflow_id` parameter to your
`build_params` and specify the Workflow you want to use
for that specific build.
