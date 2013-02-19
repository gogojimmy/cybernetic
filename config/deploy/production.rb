set :rails_env, "production"
set :user, "deployer"
set :domain, "66.175.219.39"
set :branch, "master"

server "#{domain}", :web, :app, :db, :primary => true
set :deploy_to, "/home/#{user}/#{application}"
