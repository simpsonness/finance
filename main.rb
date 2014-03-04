require 'sinatra'
require 'slim'
require 'data_mapper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")
	class Asset
		include DataMapper::Resource
		property :id,			 Serial, :key => true
		property :name, 		 String, :required => true
		property :rent,			 Integer, :required => true
		property :automatable?,	 Boolean, :default => false
		property :controllable?, Boolean, :default => false
	end
	DataMapper.finalize


get '/' do
  @assets = Asset.all
  slim :index
end


 get '/asset' do
 	@asset = params[:asset]
 	slim :asset
end

post '/asset' do
	Asset.create params[:asset]
	redirect to ('/')
end




