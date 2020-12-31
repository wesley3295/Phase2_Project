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

    
        
end