class Team < ActiveRecord::Base
    validates :team_name, presence: true, uniqueness: true

    belongs_to :user
    has_many :team_champions
    has_many :champions, through: :team_champions
        #many to many
    def slug
        team_name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
    
    def self.find_by_slug(slug)
        Team.all.find{|team| team.slug == slug}
    end
end


