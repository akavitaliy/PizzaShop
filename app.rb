#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sqlite3'
require 'sinatra/contrib'


get '/' do 
    erb :index
end

get '/about' do 
    erb :about
end


