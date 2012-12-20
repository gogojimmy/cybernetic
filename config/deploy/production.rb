set :rails_env, "production"
set :user, "cybernetic"
set :domain, "106.187.38.17"
set :branch, "master"

server "#{domain}", :web, :app, :db, :primary => true
set :deploy_to, "/home/#{user}/#{application}"
