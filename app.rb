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

class Order < ActiveRecord::Base    
end

before	do	
end

get '/' do 
    @products = Product.all    
    erb :index
end

get '/about' do 
    erb :about
end

post '/cart' do
    @orders_input = params[:order]
    @items = parse_orders_input @orders_input 
    

    if @items.length == 1
        return erb :clear_cart    
    end

    @items.each do |item|
        item[0] = Product.find(item[0])
        
    end

    erb :cart

end

get '/cart' do

    erb :cart
end

#парс получаемой строки
def parse_orders_input orders_input 
    
    s1 = orders_input.split(/,/)

    arr = []

    s1.each do |x|
        s2 = x.split(/=/)

        s3 = s2[0].split(/_/)

        id = s3[1]
        cnt = s2[1]

        arr2 = [id, cnt] 

        arr.push arr2
    end

    return arr

end   

get '/clear_cart' do
    erb :clear_cart
end