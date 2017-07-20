require "./app"
require "sinatra/activerecord/rake"
require 'securerandom'

rake_path = $root_path + settings.tasks_path
Dir.entries(rake_path).each{ |file|  load rake_path + '/' + file if file.match /rake$/ }

