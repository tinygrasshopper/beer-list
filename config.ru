require 'sinatra'

get '/' do
  erb :index, :locals => {:location => ENV["location"], :index => ENV["CF_INSTANCE_INDEX"]}
end
