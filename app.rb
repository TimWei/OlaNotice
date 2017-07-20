require 'sinatra'
require "sinatra/activerecord"
require_relative 'config/setting'
require_relative 'config/route'
require_relative 'config/models'
require 'json'
require 'date'
require 'sqlite3'
require 'pry'

$root_path = File.absolute_path('.') 
