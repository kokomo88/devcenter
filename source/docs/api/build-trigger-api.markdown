---
title: Build URL Hooks
---


# How to start a Build by calling the Trigger URL?

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

*If you provide a tag the branch parameter will be ignored. If you provide a commit_hash parameter then both the tag and the branch parameters will be ignored. These will still be logged and will be visible on the build details page but the git clone step will use the commit_hash for checkout in this case.*

## curl example

You can find a **curl configurator** on **your app's Settings tab**.

A base curl call would look like this (with a 1.0.0 *tag* build parameter):

`$ curl http://www.bitrise.io/hook/[app-slug] --data-urlencode 'payload={"hook_info":{"type":"bitrise","api_token":"[app-api-token]"},"build_params":{"tag":"1.0.0"}}'`
