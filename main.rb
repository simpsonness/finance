require 'sinatra'
require 'slim'
require 'pry'
require 'data_mapper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Asset
	include DataMapper::Resource
	property :id,             Serial
	property :name,           String,  :required => true
	property :rent,           Integer, :required => true
end
DataMapper.finalize

get '/' do
	@assets = Asset.all
	 @sum = 0
	@assets.each do |asset|
	@sum += asset.rent
end
	slim :asset
  
end

get '/asset' do
	slim :asset
end

post '/' do
	Asset.create params[:asset]
    redirect to('/')
end