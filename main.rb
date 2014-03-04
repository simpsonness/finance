require 'sinatra'
require 'slim'
require 'data_mapper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
	class Post
		include DataMapper::Resource
		property :id,			 Serial, :key => true
		property :name, 		 String, :required => true
		property :rent,			 Integer, :required => true
		property :automatable?,	 Bool, :default => false
		property :controllable?, Bool, :default => false
	end



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