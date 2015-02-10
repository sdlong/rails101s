# config valid only for current version of Capistrano
lock '3.3.5'

set :application, 'rails101s' # 你的 application name
set :repo_url, 'https://github.com/sdlong/rails101s.git' # 你的 git url

# rbenv 的設定
set :rbenv_type, :user # or :system, depends on your rbenv setup
set :rbenv_ruby, "2.1.2"
set :rbenv_path, "/usr/local/rbenv"
set :rbenv_prefix, "RBENV_ROOT=#{fetch(:rbenv_path)} RBENV_VERSION=#{fetch(:rbenv_ruby)} #{fetch(:rbenv_path)}/bin/rbenv exec"
set :rbenv_map_bins, %w(rake gem bundle ruby rails)
set :rbenv_roles, :all # default value

# Default branch is :master
# ask :branch, proc { `git rev-parse --abbrev-ref HEAD`.chomp }.call

# Default deploy_to directory is /var/www/my_app_name
set :deploy_to, "/home/apps/rails101s" # deploy 的資料夾位置 (prodution)

# Default value for :scm is :git
# set :scm, :git

# Default value for :format is :pretty
# set :format, :pretty

# Default value for :log_level is :debug
set :log_level, :debug

# Default value for :pty is false
# set :pty, true

# Default value for :linked_files is []
set :linked_files, %w(config/database.yml config/secrets.yml) # git clone 完成後會從 shared 資料夾 copy 過去的檔案

# Default value for linked_dirs is []
set :linked_dirs, fetch(:linked_dirs, []).push("bin", "log", "tmp/pids", "tmp/cache", "tmp/sockets", "vendor/bundle", "public/system") # git clone 完成後會從 shared 資料夾 copy 過去的檔案

# Default value for default_env is {}
# set :default_env, { path: "/opt/ruby/bin:$PATH" }

# Default value for keep_releases is 5
# set :keep_releases, 5

after "deploy:publishing", "deploy:restart"

namespace :deploy do
  task :restart do
    invoke "unicorn:reload"
  end
end
