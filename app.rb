require 'sinatra/base'
require "sinatra/activerecord"
require "sinatra/namespace"
require 'json'
require 'date'
require 'sqlite3'
require 'pry'
$root_path = File.absolute_path('.') 

class ErrMonitor < Sinatra::Base
  register Sinatra::ActiveRecordExtension
  register Sinatra::Namespace
end  


require_relative 'lib/route'
require_relative 'lib/setting'
require_relative 'lib/models'