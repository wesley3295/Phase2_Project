class UsersController < ApplicationController

    get '/signup' do
        erb :'users/signup'
    end
    
    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:user_id] = user.id
            redirect "/teams"
        else
            redirect "/signup"
        end
    end

    
    get '/login' do
        redirect_if_logged_in
        erb :'users/login'
    end
    
    post '/login' do
        user = User.find_by_username(params[:user][:username])
        if user && user.authenticate(params[:user][:password]) && user.email == params[:user][:email]
            session[:user_id] = user.id
            redirect "/teams"    
        else
            redirect '/login'
        end
    end
    
    get '/logout' do
        logout
        redirect '/login'
    end
    
    get '/users/most_teams' do
        @user = User.all.max_by{|u| u.teams.length}
        erb :'users/most_teams'
    end
    
    get '/users' do
        @users = User.all
       
        erb :'users/index'
    end
    
    
    get '/users/:id' do
        @user = User.find_by_id(params[:id])
        # binding.pry
      erb :'users/show'
      end
    
    # get '/users/:slug' do
    #     @user = User.find_by_id(params[:slug])
    #     erb :'users/show'
    # end
    

end

#Write a custom route so that a user can visit /users/most-teams and the user is then able to see (you can pick how) the user with the most team
#HINT: Use the max_by Ruby method to help you find the user with the most teams 