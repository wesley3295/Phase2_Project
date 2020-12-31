class ChampionsController < ApplicationController

    get '/champions' do
        erb :'/champions/index'
    end
   
end