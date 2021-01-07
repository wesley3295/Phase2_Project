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
        if @team == nil 
            redirect "/users"
        end
        erb :'/duels/new'
    end
    
    post '/duel' do
        @allied_values = []         
        @enemy_values = []         
        @enemy_team = Team.find_by_id(params[:enemy_team])         
        @allied_team = Team.find_by_id(params[:current_user_team])
        if @allied_team == nil 
            redirect "/users"
        end
        if current_user.id == @enemy_team.user_id
            redirect "/users"
        else         
            @allied_team.champions.each do |champ|             
                @allied_values << {:id =>champ.id,  :total => Hash[champ.attributes.except("ChampionId", "id", "Name", "Title").sort_by{|k,v| -v}].values.sum}
            @allied_totals = @allied_values.sum { |hash| hash[:total] }   
              
            end         
            @enemy_team.champions.each do |champ|             
                @enemy_values << {:id =>champ.id,  :total => Hash[champ.attributes.except("id","ChampionId", "Name", "Title").sort_by{|k,v| -v}].values.sum}
            @enemy_totals = @enemy_values.sum { |hash| hash[:total] }    
            end     
            
            if @enemy_totals > @allied_totals
                @enemy_team.wins += 1
                @allied_team.loses += 1
                   
            elsif @enemy_totals < @allied_totals
                @enemy_team.loses += 1
                @allied_team.wins += 1
            
            end
        end

            @enemy_team.save
            @allied_team.save
        

        erb :'/duels/duel'
    end

end