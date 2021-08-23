web: bundle exec puma -C config/puma.rb
release: heroku run rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
 && heroku run rake db:create && heroku run rake db:migrate && heroku run rake db:seed
