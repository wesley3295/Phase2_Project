require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    enable :sessions
    set :public_folder, 'public'
    set :views, 'app/views'
    set :session_secret, ENV['SESSION_SECRET']
  end

  get "/" do
    erb :welcome
  end

  helpers do

    def current_user
      @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id] 
    end
    
    def logged_in?
      !!current_user
    end

    def logout
      session.clear
    end

    def redirect_if_logged_in
      redirect '/teams' if logged_in?
    end

    def redirect_if_logged_in
      redirect '/teams' if logged_in?
    end
    
  end

end
