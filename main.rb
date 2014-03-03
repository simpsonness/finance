require 'sinatra'
require 'slim'
require 'data_mapper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

 
get '/' do
  slim :index
end
 
get '/:item' do
	@item = params[:item]
	slim :item
end

post '/' do
	@item = params[:item]
	slim :item
end