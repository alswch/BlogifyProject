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
get '/home' do
	puts "\n******* home *******"
	erb :home
end


# ======= ======= USER: PROFILE PAGE ======= ========
get '/user_profile' do
  puts "\n****** user profile ******"
  erb :user_profile
end

# ======= ======= USER: REGISTER ======= ========
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
  redirect '/signin'
end

# ======= ======= USER: SIGN IN ======= ========
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
			redirect '/blog_feed'
		else
			flash[:notice] = "Please check your password and try again."
			redirect "/signin"
		end
	else
		flash[:notice] = "Please check your username and try again."
		redirect "/signin"
	end
end

# ====== USER: SIGN OUT =======
get '/signout' do
  puts "\n****** logout ******"
  session[:user_id] = nil
  flash[:notice] = "You've sucessfully logged out"
  redirect '/'
end

# ======= GET CURRENT USER =======
def get_current_user
    # puts "\n******* get_current_user *******"
    if session[:user_id]
        return User.find(session[:user_id])
    else
        puts "** NO CURRENT USER **"
    end
end

# ======= USER: UPDATE ACCOUNT =======
get '/user_update' do
  puts "\n****** user update ******"
  puts "params: #{params.inspect}"
  @current_user = get_current_user
  erb :user_update
end

post '/user_update' do
  puts "\n****** user update *******"
  puts "params: #{params.inspect}"
  @user = User.find(params[:user_id])
  @user.update(username: params[:username], password: params[:password], firstname: params[:firstname], lastname: params[:lastname], email: params[:email])
  flash[:notice] = "Successfully updated your profile."
  redirect '/user_profile'
end

# ======= USER: DELETE ACCOUNT =======
get '/deleteuser/:id' do
  puts "\n****** delete user *******"
  User.find(session[:user_id]).destroy
  redirect '/'
end

# ======= ======= ======= BLOG: POSTS ======= ======= =======
# ======= ======= BLOG: FEED PAGE ======= =======
get '/blog_feed' do
  puts "\n******* blog feed page *******"
  erb :blog_feed
end

# ======= ======= BLOG: CREATE NEW POST ======= =======
get '/new_post' do
  puts "\n******* new post *******"
  erb :new_post
end
post '/create_new_post' do
  puts "\n******* create new post *******"
  puts "params: #{params.inspect}"
  Post.create(
    title: params[:title],
    content: params[:content],
    user_id: session[:user_id]
  )
  @post = Post.order("created_at").last
  redirect '/blog_feed'
end

# ======= ======= BLOG: ADD COMMENT ======= =======
