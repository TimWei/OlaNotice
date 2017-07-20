# 執行環境
# set :environment, :production
set :environment, :development

# server設定
# set :bind, '0.0.0.0'
set :bind, 'localhost'
set :port, '5566'

# 項目目錄
set :root, File.dirname(__FILE__)

# 數據庫設定
set :database, "sqlite3:err_log.sqlite3"

# rake files
set :tasks_path, "/tasks"

# 版本
set :version, '0.0.1'