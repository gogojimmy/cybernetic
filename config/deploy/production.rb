set :rails_env, "production"
set :user, "jaja"
set :domain, "cybernetic.gogojimmy.net"
set :branch, "master"

server "#{domain}", :web, :app, :db, :primary => true
set :deploy_to, "/home/#{user}/#{application}"
