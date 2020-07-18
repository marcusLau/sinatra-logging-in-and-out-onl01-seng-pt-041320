require_relative '../../config/environment'
class ApplicationController < Sinatra::Base
  configure do
    set :views, Proc.new { File.join(root, "../views/") }
    enable :sessions unless test?
    set :session_secret, "secret"
  end

  get '/' do
    erb :index
  end

  post '/login' do
    # Find the user in the db based on their username in params
    user = User.find_by(username: params[:username], password: params[:password])
    if user
      session[:user_id] = user.id
      redirect to '/account'
    else
      erb :error
    end
  end

  get '/account' do
    # use is_loggedIn? to only display username/balance IFF user is loggeed in 
    # else a homepage link is displayed (current_user to display username/balance)
    erb :account
  end

  get '/logout' do
    session.clear
    redirect to '/'
  end


end

