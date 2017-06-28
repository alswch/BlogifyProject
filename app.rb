# ======= requires =======
require "sinatra"
require 'sinatra/activerecord'
require "sinatra/reloader" if development?
require "sinatra/flash"
# ======= models =======
require './models'
# ======= database =======
set :database, "sqlite3:blogify.db"
# ======= sessions =======
enable :sessions

# ======= home =======
get '/' do
	puts "\n******* home *******"
	erb :home
end

# ======= ======= USER REGISTER ======= ========
get '/register' do
  puts "\n******* register *******"
  erb :register
end

post '/user_form' do
  puts "\n****** new user ******"
  puts "params: #{params.inspect}"
  User.create(
    username: params[:username],
    password: params[:password],
    firstname: params[:firstname],
    lastname: params[:lastname],
    email: params[:email]
  )
  @user = User.order("created_at").last
  redirect '/'
end

# ======= ======= USER SIGN IN ======= ========
get '/signin' do
  puts "\n******* signin *******"
  erb :signin
end

post '/signin' do
	puts "\n******* signin *******"
    @user = User.where(username: params[:username]).first
	if @user
		if @user.password == params[:password]
			session[:user_id] = @user.id
            @current_user = get_current_user
			flash[:notice] = "You've been signed in successfully."
			redirect '/'
		else
			flash[:notice] = "Please check your password and try again."
			redirect "/signin"
		end
	else
		flash[:notice] = "Please check your username and try again."
		redirect "/signin"
	end
end

# ====== SIGN OUT =======
get '/signout' do
  puts "\n****** logout ******"
  @user = nil
  flash[:notice] = "You've sucessfully logged out"
  redirect '/'
end

# ======= get_current_user =======
def get_current_user
    # puts "\n******* get_current_user *******"
    if session[:user_id]
        return User.find(session[:user_id])
    else
        puts "** NO CURRENT USER **"
    end
end
