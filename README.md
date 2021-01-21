# README

This README would normally document whatever steps are necessary to get the
application up and running.

For the truck app
Simply run: `rails s -p 3000`

For the train api
Go to the [train api](https://github.com/mmmmaximus/rails-train-api)
Run: `rails s -p 3001`

To visit the truck app: `localhost:3000`
To visit the train api: `localhost:3001`
To see list of trains on the api: `localhost:3000/v1/trains`

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...

- add required gems in gemfile

* For the models
- generate controllers
- include CRUD for controllers
- generate models
- run migrations https://guides.rubyonrails.org/active_record_migrations.html#creating-a-migration
- model validations
- model specs
- add associations if 2 models references each other https://dev.to/neshaz/everything-there-is-to-know-about-associations-in-rails-52ii

* For views
- add index table
- use partials for repeat tables
- add feature tests, request spec,

* User authentication
- add authentication https://medium.com/@wintermeyer/authentication-from-scratch-with-rails-5-2-92d8676f6836

* Using dotenv for environment variables
- install gem 'dotenv'
- create .env file in root of project
- assign variables for api url
- for e.g. TRAIN_API_URL = localhost:3001
- create a copy of the file in the root as .env.sample
- add .env to .gitignore under ignore master key
