require 'sinatra'
require 'sequel'

DB = Sequel.connect(ENV["DATABASE_URL"])
DB.create_table? :beers do
  primary_key :id
  String :region
  String :brand
end

get '/' do
  data = DB[:beers]
  erb :index, :locals => {:location => ENV["location"], :index => ENV["CF_INSTANCE_INDEX"], :data => data}
end

post '/create' do
  DB[:beers].insert(params)
  redirect '/'
end
