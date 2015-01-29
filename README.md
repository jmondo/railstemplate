# Readme

## Change a few things
Do a project search for changeme and change to your own app name.

## Set up some gems
* bundle update
* copy env file from another developer for keys (stripe, aws, etc)
* set up commontator https://github.com/lml/commontator
* uncomment stripe in application.rb and initializers/stripe.rb
* change raygun initializer after you `heroku adddons:add raygun`
* change admin password in create admins migration
* change new relic name, api key
* change queue_adapter to sidekiq in application.rb if you want to use it

## To start the app

```bash
bundle install
rake db:create db:migrate
gem install foreman
foreman start
# go to http://localhost:5000
```

Environment vars are in .env file and are automatically loaded into foreman

Set the app name in application helper

## Gems
* haml
* puma / rack-timeout
* sidekiq (via activejob)
* bootstrap

## Jobs

Generate a job like this
```bash
rails generate job guests_cleanup --queue urgent
```
http://guides.rubyonrails.org/active_job_basics.html

sidekiq is installed and set as the queue processor.
