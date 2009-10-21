set :application, "portfolio"

set :repository, "." 
set :scm, :none 
set :deploy_via, :copy
set :copy_exclude, [".svn", ".DS_Store", ".git"]
set :user, "slainer68"
set :runner, "slainer68"
set :use_sudo, false
set :rails_env, "production"
set :deploy_to, "/home/slainer68/portfolio"

role :web, "salsaonrails.eu"                       # Your HTTP server, Apache/etc
role :app, "salsaonrails.eu"                          # This may be the same as your `Web` server
role :db,  "salsaonrails.eu", :primary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts

namespace :mod_rails do
  desc <<-DESC
  Restart the application altering tmp/restart.txt for mod_rails.
  DESC
  task :restart, :roles => :app do
    run "touch  #{current_release}/tmp/restart.txt"
  end
end
 
namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
end
