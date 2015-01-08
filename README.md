# Readme

## To start the app

```ruby
bundle install
rake db:create db:migrate
gem install foreman
foreman start
# go to http://localhost:5000
```

environment vars are in .env file and are automatically loaded into foreman
set the app name in application helper

For jobs:

generate a job like this
```ruby
rails generate job guests_cleanup --queue urgent
```
http://edgeguides.rubyonrails.org/active_job_basics.html

sidekiq is installed and set as the queue processor.
