require 'sinatra'

get '/' do
  erb :index, :locals => {:location => ENV["location"]}
end
