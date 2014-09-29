---
title: Replace or download project resources
---

# Replace or download project resources

First you'll have to download your resource files.
You can do this in quite a few ways, these are probably the easiest ones:

* use the **ZIP Resource Downloader** Step
* use a **Bash Script** Step

If you have your resources on your server in a zip archive all you have to
do is add the *ZIP Resource Downloader* Step to your Workflow,
specify the URL of the ZIP and the destination where the zip's content should be
uncompressed.

> You can find an **Insert Variable** button under every input field.
> With this you can insert environment variables defined by Bitrise
> (for example the App's title, the Build's unique ID or the Build's
> URL on Bitrise) and environment variables exported by Steps
> which will run before this step (for example an Xcode Build's
> status or the generated IPA path).

The source code of your app will be (by default) downloaded into
the folder defined in the *BITRISE_SOURCE_DIR* environment variable.

If you want to place the content of your ZIP archive into a folder
called *myresource* inside your app's source code dir you can define
the extract target folder (of the *ZIP Resource Downloader* step)
as `${BITRISE_SOURCE_DIR}/myresource`.

If you want to control the whole download process you can use
the *Bash Script* step and write your own download code, something like this:

    #!/bin/bash
    # Download your resource
    curl -fo "download/path" "https://url/of/your/resource"
    # Uncompress it
    unzip -u "download/path" -d "uncompress/target/path"

You can use [Homebrew](http://brew.sh/) to install additional programs
like an FTP client (`$ brew install lftp` for example),
or use git if you keep your resources in another repository:

    #!/bin/bash
    git clone url/of/your/git/repository.git path/to/place/the/resources

The default user which runs your build is configured
with *passwordless sudo* enabled, you're free to install any
software you need.

> For more information about the preinstalled programs and
> about the default virtual machine environment
> check out the [Virtual Machines and Base Box updates](/docs/virtual-machine-updates.html)
> article.
