# Deploy and rollback on Heroku in staging and production
# TODO add new relic deployment tracking
# https://docs.newrelic.com/docs/agents/ruby-agent/features/recording-deployments-ruby-agent
task :deploy_production => ['deploy:set_production_app',
                            'deploy:test',
                            'deploy:tag',
                            'deploy:push',
                            'deploy:migrate',
                            'deploy:post_deploy',
                            'deploy:restart']

namespace :deploy do
  PRODUCTION_APP = 'findmevids'

  PRODUCTION_NEWRELIC_APP_ID = nil # put this in after your first deploy
  NEWRELIC_HTTP_API_KEY = nil # put this in once you create an account

  task :set_production_app do
    APP = PRODUCTION_APP
    NEWRELIC_ID = PRODUCTION_NEWRELIC_APP_ID
    BRANCH = 'master' # change this when we make a production branch
  end

  task :test do
    puts "Tests first!"

    unless system 'RAILS_ENV=test foreman run bundle exec rspec --fail-fast'
      puts "FIX YO' TESTS"
      fail
    end
  end

  task :push do
    puts "Deploying #{BRANCH} to #{APP}..."
    puts `git push origin #{BRANCH}`
    puts `git push -f git@heroku.com:#{APP}.git #{BRANCH}:master`
  end

  task :restart do
    puts 'Restarting app servers...'
    run_clean "heroku restart --app #{APP}"
  end

  task :migrate do
    puts 'Running database migrations...'
    # TODO: maybe add backup task here
    run_clean "heroku run rake db:migrate --app #{APP}"
  end

  task :off do
    puts 'Putting the app into maintenance mode...'
    run_clean "heroku maintenance:on --app #{APP}"
  end

  task :on do
    puts 'Taking the app out of maintenance mode...'
    run_clean "heroku maintenance:off --app #{APP}"
  end

  task :tag do
    release_name = "#{APP}_release-#{Time.now.utc.strftime("%Y%m%d%H%M%S")}"
    puts "Tagging release as '#{release_name}'"
    puts `git tag -a #{release_name} #{BRANCH} -m 'Tagged release'`
    puts `git push origin #{release_name}`
  end

  task :post_deploy do
    if NEWRELIC_ID
      puts 'Notifying new relic of deploy...'
      puts %x{curl -H "x-api-key:#{NEWRELIC_HTTP_API_KEY}" \
        -d "deployment[application_id]=#{NEWRELIC_ID}" https://api.newrelic.com/deployments.xml \
        -d "deployment[revision]=`git rev-parse HEAD`"}
    end
  end

  def run_clean command
    Bundler.with_clean_env {
      puts `#{command}`
    }
  end
end
