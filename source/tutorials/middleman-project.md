---
title: Auto Deploy your Middleman website with Bitrise
---

# Auto Deploy your Middleman website with Bitrise

This tutorial helps you create a basic project with Middleman and connect it with Bitrise. Just follow these steps in order:

1. Create and clone a repository on Github
2. Install Middleman
3. Create a Middleman project
4. Connect your repository with Bitrise
5. Prepare your Workflow
6. Add an Amazon S3 bucket sync to your Workflow steps
7. Run build manually
8. Run builds automatically

## 1. Create and clone a repository on Github

To create a new repository on Github, [click here](https://github.com/repositories/new). You need to sign in with your Github account, or sign up if you don't have one yet. Once you created your repository, clone it.

## 2. Install Middleman

*If you already have Middleman installed, you can skip this step.*

Middleman is distributed using the RubyGems package manager. This means you will need both the Ruby language runtime installed and RubyGems to begin using Middleman.

Mac OS X comes prepackaged with both Ruby and Rubygems, however, some of the Middleman's dependencies need to be compiled during installation and on OS X that requires Xcode. Xcode can be installed via the [Mac App Store](http://itunes.apple.com/us/app/xcode/id497799835?ls=1&mt=12). Alternately, if you have a free Apple Developer account, you can just install Command Line Tools for Xcode from their [downloads page](https://developer.apple.com/downloads/index.action).

Once you have Ruby and RubyGems up and running, execute the following from the command line:

	gem install middleman

This will install Middleman, its dependencies and the command-line tools for using Middleman.

## 3. Create a Middleman project

To create a Middleman project, navigate to the root folder of your repository and execute the following from the command line:

	middleman init my_new_project

Once the setup is finished, commit and push your changes.

## 4. Connect your repository with Bitrise

To connect your repository with Bitrise, visit the [Bitrise](https://www.bitrise.io/) site. You need to sign in with your Bitrise account, or sign up if you don't have one yet. Once you're signed in, select [Add new App](https://www.bitrise.io/apps/add) in the top dropdown menu.

In the first step, you need to select the provider, where you store your code, in this case, Github.

In the second step, you will see a list of all your repositories on Github. Select the one you just created.

In the third step, you will get an alert, since the repository you are connecting is not an Xcode project. Select "Configure Manually", then enter the branch name "master". The other two fields are only important if you are connecting an Xcode project, so in this case, can contain anything (but cannot be left blank).

## 5. Prepare your Workflow

Once you created your project, select it in the [Dashboard](https://www.bitrise.io/dashboard) and select the *Workflow* tab from the top menu. We are going to add a bash script that will be executed on each build. First, we delete all the automatically created steps by selecting *Workflow actions > Delete all Steps from this Workflow*. Next, we need to add new steps. You can add new steps by clicking on the *Add new Step* button and selecting the step. Add the following steps to your Workflow, in this order:

1. Git Clone Repository
2. Bash Script

Select the Bash Script step and add the following lines:

	cd $BITRISE_SOURCE_DIR
	bundle install
	bundle exec middleman build --verbose

$BITRISE_SOURCE_DIR is a local variable that contains the source path of your project on the virtual machine that runs the build. The above code navigates to that folder, installs the dependencies specified in your Gemfile, and runs a Middleman build on the virtual machine.

## 6. Add an Amazon S3 bucket sync to your Workflow steps

Now we are going to add and customize an Amazon S3 bucket sync to the Workflow steps. Click on the *Add new Step* button and select *Amazon S3 bucket sync* from the step list.

Select the step to customize it. Enter your AWS access key, your AWS secret key and enter a name for your S3 bucket. For your local path, enter the following code:

	$BITRISE_SOURCE_DIR/build/

This will select the *contents* of the build folder in the project source path on the virtual machine. It will be uploaded on every build.

For access control, enter *public-read* or *private*, as advised.

## 7. Run build manually

Once the configuration of your Workflow is complete, you can run a build manually by clicking on the *Build [branch_name]* button at the top-right of the page.

## 8. Run builds automatically

If you chose Github when adding your repository, each code change (commit) on Github will automatically trigger a Bitrise build.