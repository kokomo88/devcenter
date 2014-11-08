---
title: Setup a webhook to your app on Bitrise
---

# Setup a webhook to your app on Bitrise

This tutorial helps you to setup a webhook to your app on Bitrise. By default, when adding a new app, if you select Github or Bitbucket as the source code provider of your app repository, Bitrise automatically sets up a webhook to it. In this case, you can skip this tutorial. But if you specify your repository manually (even if it is a Github, or Bitbucket repository), you need to setup the webhook yourself. You can learn all about it in this tutorial, just follow these steps in order:

1. Add a new app with manually specified repository on Bitrise
2. Get the webhook URL from Bitrise
3. Add the webhook URL to your repository on your source code provider's website

## 1. Add a new app with manually specified repository on Bitrise

To add a new app on Bitrise, select *Add new app* on the Bitrise Dashboard, or [click here](http://www.bitrise.io/apps/add).

In the first step, you need to select the source code provider of your app. For the purposes of this tutorial, select *Click here to set up your repository manually*, then copy and paste your GIT repository URL. For public repositories, use HTTPS URL, for private repositories, use SSH URL. Next, select how Bitrise will be able to access the source code, and follow the instructions.

After the validation of your repository is finished, the app is connected to Bitrise.

## 2. Get the webhook URL from Bitrise

To get the webhook URL from Bitrise, select your app on the Bitrise Dashboard and select the settings tab, where you can find your build trigger URL

## 3. Add the webhook URL to your repository on your source code provider's website

- If your source code provider is Github, visit the [Github website](https://github.com), select your repository, then go to *Settings*. Next, select *Webhooks & Services* and click *Add webhook*. Paste your webhook URL in the field *Payload URL*. Select *application/x-www-form-urlencoded* as the content type. You can leave the secret field blank. Below, you can specify which events will trigger a build on Bitrise. After you finished, click on *Add webhook*.
- If your source code provider is Bitbucket, visit the [Bitbucket website](https://bitbucket.org), select your repository, then go to the repository settings. Under *Integratins*, select *Hooks*, then select *POST* from the dropdown list, then *Add hook*. Paste your webhook URL in the field, then select *Save*.
- If your source code provider is none of the above, you can use our Build Trigger API to trigger builds on Bitrise. For more information about using the Bitrise Build Trigger API, [click here](http://devcenter.bitrise.io/docs/api/build-trigger-api.html).