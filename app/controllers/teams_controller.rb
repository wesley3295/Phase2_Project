class TeamsController < ApplicationController
  
  get '/teams/new' do
    erb :'/teams/new'
  end
  
  post '/teams' do
      if logged_in?
        if params[:team_name] == "" || params[:user][:champion_ids].length != 5
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

  

end
