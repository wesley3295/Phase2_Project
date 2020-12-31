class TeamChampion < ActiveRecord::Base
    belongs_to :champion
    belongs_to :team
end