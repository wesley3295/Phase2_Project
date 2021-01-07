
class Champion < ActiveRecord::Base 
    has_many :team_champions
    has_many :teams, through: :team_champions  
end