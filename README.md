# Readme

## Change a few things
Do a project search for typesimple (that was the original app name) and change to your own app name.

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
