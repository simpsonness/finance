require 'sinatra'
require 'slim'
require 'data_mapper'
DataMapper.setup(:default, ENV['DATABASE_URL'] || "sqlite3://#{Dir.pwd}/development.db")

class Asset
	include DataMapper::Resource
	property :id,             Serial
	property :rent,           Integer, :required => true
end
DataMapper.finalize

get '/' do
	@assets = Asset.all
	slim :index
end

get '/asset' do
	slim :asset
end

post '/' do
	Asset.create params[:asset]
	redirect to('/')
end