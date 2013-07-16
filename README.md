# Rails Template

This is a template Rails 4.0.0 application built off of [this commit of bchase/rails-template](https://github.com/bchase/rails-template/commit/789d5c2dd8920a1d7cdc6f1f50bcae17b2dfa84f). It uses:

* Haml, SimpleForm
* RSpec, Cucumber, factory_girl, Poltergeist, Guard, Spork
* Twitter Bootstrap, Font Awesome
* Unicorn Procfile

> If you would also like basic user auth, please see the instructions on the `devise` branch below.

## Development

### Requirements

Assuming you're on a *nix system, install [RVM (Ruby Version Manager)](https://rvm.io/) with:

```bash
$ curl -L https://get.rvm.io | bash -s stable --ruby
```

Then check to see that you have Ruby 2.0.0 or later:

```bash
$ ruby --version
ruby 2.0.0p0 (2013-02-24 revision 39474) [x86_64-linux]

# rvm should auto-install Ruby 2.0.0 or greater, if not run:
# $ rvm install 2.0.0
```

You will also need to have a [PostgreSQL](http://www.postgresql.org/) 9.1 server running locally. Once you have that set up, ensure that you have an account for your `$USERNAME` with an empty password:

```
$ sudo -u postgres psql
postgres=# CREATE ROLE <username> SUPERUSER LOGIN;
```

### Obtaining and Using the Rails App

First, obtain the code:

```bash
# move to your development directory
$ cd dev-dir

# then clone the git repo into that directory
$ git clone git@github.com:doubleclickdetroit/buffalo.git
```
Then get up and running with:

```bash
$ bundle install    # install necessary gems
$ rake db:create    # create the database
$ rake db:migrate   # migrate the new database
$ foreman start     # start the rails server
```

## Deploying to Heroku

```
# create a heroku account at http://api.heroku.com/signup

# install the toolbelt per https://toolbelt.heroku.com/

# login
$ heroku login

# create a heroku app
$ heroku create [app-name]

# deploy
$ git push heroku master

# rake the db
$ heroku run rake db:migrate

# rails console
$ heroku run console 

# it's worth noting that the `heroku create` above will
# create an app _and_ a git remote just the same as if you ran:
# $ heroku git:remote --app [app-name] --remote heroku
# additionally, `git push heroku master` follows the format:
# $ git push [git-remote-name] [branch]
# and uses the `heroku` remote from above
```

## Checking Available Routes

For a local Rails app:

```bash
$ rake routes
```

For Heroku:

```bash
$ heroku run rake routes
```

## Updating Rails

If your application is running on Heroku, and this update is in regards to a security vulnerability, it's a good idea to activate maintenance mode on production while you work. This can be accomplished with the following:

```bash
$ heroku maintenance:on
```

It's also a good idea to run all your tests before and after updating, so that you can compare the failure numbers and ensure the update did not cause any regressions. Run everything and take note of the numbers for passed/failed/pending:

```bash
$ rake cucumber
$ rake rspec
```

Now open up the `Gemfile` and change the version string for Rails:

```ruby
### Gemfile ###

source 'https://rubygems.org'

gem 'rails', '4.0.0' # <= VERSION STRING
# ...
```

Then update the bundle:

```bash
$ bundle update rails
```

If all goes well, try re-running the tests/specs:

```bash
$ rake cucumber
$ rake rspec
```

Compare the passed/failed/pending counts to those before and adjust as needed.

Once everything works, make a commit, push your changes, and deploy (if applicable):

```bash
$ git add .
$ git commit -m 'update rails[, additional information]'

# push to origin
$ git push

# deploy to heroku
$ git push heroku master
```

Finally, be sure to turn your maintenance message off:

```bash
$ heroku maintenance:off
```
