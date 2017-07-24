require 'sinatra/base'
require 'sinatra/activerecord'
require 'sinatra/namespace'
require 'sinatra/cross_origin'
require 'json'
require 'date'
require 'sqlite3'
require 'pry'

$root_path = File.absolute_path('.') 

class ErrMonitor < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace
  configure do
    enable :cross_origin
  end
  before do
    response.headers['Access-Control-Allow-Origin'] = '*'
  end
end  


require_relative 'lib/route'
require_relative 'lib/setting'
require_relative 'lib/models'