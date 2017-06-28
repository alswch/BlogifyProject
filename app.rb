# ======= requires =======
require "sinatra"
require 'sinatra/activerecord'
# require "sinatra/reloader" if development?
require "sinatra/flash"
# ======= models =======
# require './models'
# ======= database =======
# set :database, "sqlite3:<db_name>.db"
# ======= sessions =======
# enable :sessions
# ======= home =======
get '/' do
	puts "\n******* home *******"
	erb :home
end

get '/signin' do
  puts "\n******* signin *******"
  erb :signin
end
