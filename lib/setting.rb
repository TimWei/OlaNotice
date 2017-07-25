class ErrMonitor < Sinatra::Base
  # 執行環境
  # set :environment, :production
  set :environment, :development

  # Host白名單
  set :host_whitelist, ['localhost:9292','www.google.com']
  
  # server設定
  # set :bind, '0.0.0.0'
  set :bind, 'localhost'
  set :port, '5566'

  # 項目目錄
  set :root, File.dirname(__FILE__)

  # 數據庫設定
  set :database, {adapter: "sqlite3", database: "db.sqlite3"}

  # rake files
  set :tasks_path, "/tasks"

  # 版本
  set :version, '0.0.1'
  
  # CORS
  configure do
    enable :cross_origin
  end
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
end