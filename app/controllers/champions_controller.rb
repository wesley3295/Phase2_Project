class ChampionsController < ApplicationController

    get '/champions' do
        erb :'/champions/index'
    end

    get '/champions/:id' do
        find_champion
        @stats = @champ.attributes.except("id")
        erb :'champions/show'
    end

    private
    def find_champion
        @champ = Champion.find_by_id(params[:id])
    end

end