set :application, "portfolio"

set :repository,  "git@github.com:slainer68/#{application}.git"
set :scm, "git"
set :repository_cache, "git_cache"
set :copy_exclude, [".svn", ".DS_Store", ".git"]
set :user, "slainer68"
set :runner, "slainer68"
set :use_sudo, false
set :rails_env, "production"
set :deploy_to, "/home/slainer68/projects/#{application}"

role :web, "nicolasblanco.fr"                       # Your HTTP server, Apache/etc
role :app, "nicolasblanco.fr"                          # This may be the same as your `Web` server
role :db,  "nicolasblanco.fr", :primary => true

# If you are using Passenger mod_rails uncomment this:
# if you're still using the script/reapear helper you will need
# these http://github.com/rails/irs_process_scripts
after "deploy:update_code", "deploy:do_all_symlinks"

namespace :mod_rails do
  desc <<-DESC
  Restart the application altering tmp/restart.txt for mod_rails.
  DESC
  task :restart, :roles => :app do
    run "touch  #{release_path}/tmp/restart.txt"
  end
end
 
namespace :deploy do
  %w(start restart).each { |name| task name, :roles => :app do mod_rails.restart end }
    
  desc "Make all necessary symlinks"
  task :do_all_symlinks do
    run "ln -nfs #{shared_path}/config/database.yml #{release_path}/config/database.yml"
  end
end
