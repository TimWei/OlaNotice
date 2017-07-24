require 'sinatra/base'
require "sinatra/activerecord"
require 'json'
require 'date'
require 'sqlite3'
require 'pry'
$root_path = File.absolute_path('.') 

class ErrMonitor < Sinatra::Base

end  


require_relative 'lib/route'
require_relative 'lib/setting'
require_relative 'lib/models'