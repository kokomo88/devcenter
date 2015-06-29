---
title: Manage your Bitrise workflow
---

# Manage your Bitrise workflow

To start editing your workflow you first have to open it in the
**Workflow Editor** on Bitrise.io:

1. Open your App's page on [Bitrise.io](https://bitrise.io/)
2. Select the **Workflow tab**
3. Click on the **Manage Workflows** button

This is your app's Workflow Editor/Manager.
You can change, delete and add steps here.

**To change a step**: select the step here (in the Workflow Editor), on the left side. You can change it's inputs on the right side.

**To remove a step**: select the step on the left side and click on the **delete** button on the right side.

**To add a new step**: click on the `+` sign at the left side to add or insert a new step.
*Note: Steps are executed top-to-bottom, you can reorder them with drag-and-drop.*

Once you clicked the `+` sign you'll see a list of available steps on the right side.
You can select a filter (ex: `deploy`) to show only a group of the available steps.

Once you selected the step you want to add just click on the **Add to Workflow**
button, it'll be added to your step list (listed on the left side),
and all you have to do is fill in it's required inputs (select the step - on the left side -
and on the right side you'll see which inputs are required - marked with an orange border).

## Create a new Workflow

You can create as many workflows for an app as you like. Using multiple
workflows can be beneficial in case you want to do different things based on
which *branch* you push new code.

To create a new Workflow just click on the `+` sign at the top where
your workflows are listed (if it's your first workflow then
you should only have a **Primary** workflow and a `+` sign right at it's right side).

*New Workflows are always created from your Primary workflow.
You can add and delete as many workflows as you choose to, except you
can't delete your **Primary** workflow.*

Workflow naming: as you can see on the popup a Workflow's name is supposed to
match the **branch's name** which should trigger the given Workflow.
In every other case (if you push code to a branch which doesn't have
a Workflow on Bitrise) your Primary workflow will be used to run the build.

**You can read more about how to use multiple Bitrise Workflows
at: [Efficient Continuous Integration and Deployment Workflow for iOS development](/tutorials/efficient-continuous-integration-and-deployment-workflow-for-ios.html)**.
