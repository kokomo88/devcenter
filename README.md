Bitrise DevCenter
==================

Website: http://devcenter.bitrise.io/


# TODO

* how to register a new app
* about the build workflow:
  * what is a build workflow
  * who can manage it
  * drag and drop to reorder, add new step
  * what is a Step (public script repo with step.sh)
* events page
* how to set Provisioning Profile and Certificate
* how to add a git hook / build trigger hook to GitHub / Bitbucket / custom repo


# Dev setup

* clone this repository
* `bundle install`
* `bundle exec middleman`
* Open [http://localhost:4567/](http://localhost:4567/) in your browser


## With docker-compose

* `sudo su`
* `docker-compose up`
* Open [http://localhost:4567/](http://localhost:4567/) in your browser
    * If you run Docker in a virtual machine you might have to set a port-forward for the virtual machine!


### Useful / cheat-sheat

* To stop: just press `Ctrl + C`
* To re-build the image: `docker-compose build`
* To remote docker containers: `docker-compose rm`
