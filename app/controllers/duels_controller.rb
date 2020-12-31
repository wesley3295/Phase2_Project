class DuelsController < ApplicationController

    # get '/duels' do
    #     @teams = Team.all
    #     @team = Team.find_by_id(session[:team_id])
    #     @user = current_user
    #     erb :'/duels/home'
    # end
  
    get '/duels/:id/new' do
        @user = current_user
        @teams = Team.all
        @team = Team.find_by_id(params[:id])
        erb :'/duels/new'
    end
    
    post '/duel' do
        @allied_values=[]
        @enemy_values=[]
        @enemy_team = Team.find_by_id(params[:enemy_team])
        @allied_team = Team.find_by_id(params[:current_user_team])
        @allied_team.champions.collect do |champ|
            @allied_stats=champ.attributes.except("Name", "Title","id","ChampionId") 
        end
        @allied_stats.each do |k,v|
            @allied_values << v  
        end  
        @enemy_team.champions.collect do |champ|
            @enemy_stats=champ.attributes.except("Name", "Title","id","ChampionId") 
        end
        @enemy_stats.each do |k,v|
            @enemy_values << v  
        end  
        erb :'/duels/duel'
    end

end