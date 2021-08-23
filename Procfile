web: bundle exec puma -C config/puma.rb
release: bundle exec rake db:drop DISABLE_DATABASE_ENVIRONMENT_CHECK=1
 && bundle exec rake db:create && bundle exec rake db:migrate && bundle exec rake db:seed
