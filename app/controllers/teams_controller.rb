class TeamsController < ApplicationController
  
  get '/teams/new' do
    erb :'/teams/new'
  end
  
  post '/teams' do
      if logged_in?
        if params[:team_name] == "" || params[:user][:champion_ids] == nil || params[:user][:champion_ids].length != 5
          redirect to "/teams/new"
        else
          # @team = current_user.teams.build(team_name: params[:user][:team_name], champion_ids: params[:user][:champion_ids])
          @team = Team.create(team_name: params[:user][:team_name], champion_ids: params[:user][:champion_ids], user_id: current_user.id)
          if @team.save
            redirect to "/teams/#{@team.id}"
         else
            redirect to "/teams/new"
          end
       end
        else
          redirect to '/login'
   end
end

    get '/teams' do
        @teams = Team.all
        @team = Team.find_by_id(session[:team_id])
        @user = current_user
        erb :'/teams/index'
    end

    
    get '/teams/:id' do
      find_team
      redirect_if_team_not_found
      erb :'/teams/show'
    end
    
    get '/teams/:id/edit' do
      find_team   
      redirect_if_team_not_found
      if authorized?
      erb :'teams/edit'
      else 
        redirect to "/teams/#{@team.id}"
      end
    end
    
    patch '/teams/:id' do
      find_team
        redirect_if_team_not_found
        if params[:team_name] == "" || !params[:user][:champion_ids] == nil|| params[:user][:champion_ids].length != 5
          redirect "teams/#{@team.id}/edit"
        elsif @team.update(params[:user])
          redirect "/teams/#{@team.id}"
        else
          redirect "/teams/#{@team.id}/edit"
        end
      end
      
      delete '/teams/:id' do
        find_team
        if @team
          @team.destroy
          redirect "/teams"
        end
      end
      
      private
      def find_team
        @team = Team.find_by_id(params[:id])
      end
      
      
      def redirect_if_team_not_found
        redirect "/teams" unless @team
      end
      
      def authorized?
        current_user == @team.user
      end
    end
    
    # get '/teams/:slug' do
    #   find_team_by_slug
    #   redirect_if_team_not_found_slug
    #   erb :'/teams/show'
    # end
    
    # get '/teams/:slug/edit' do
    #   find_team_by_slug
    #   redirect_if_team_not_found
    #   erb :'teams/edit'
    # end
    # patch '/teams/:slug' do
    #   find_team_by_slug
    #   redirect_if_team_not_found
    #   if params[:team_name] == "" || !params[:user][:champion_ids] == nil|| params[:user][:champion_ids].length != 5
    #     redirect "teams/:slug/edit"
    #   elsif @team.update(params[:user])
    #     redirect "/teams/:slug"
    #   else
    #     redirect "/teams/:slug/edit"
    #   end
    # end
    
    # private
    # def find_team_by_slug
    #   @team_slug = Team.find_by(slug)
    # end
    # def redirect_if_team_not_found_slug
    #   redirect "/teams" unless @team
    # end
    # end