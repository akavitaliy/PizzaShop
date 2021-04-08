#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/reloader'
require 'sinatra/activerecord'
require 'rake'

set :database, {adapter: "sqlite3", database: "pizza.db"}

class Product < ActiveRecord::Base
    
end


get '/' do 
    @products = Product.all
    erb :index
end

get '/about' do 
    erb :about
end


