class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_many :teams
    has_many :champions, through: :teams
    has_secure_password

    def slug
        username.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end
    
    def self.find_by_slug(slug)
        User.all.find{|user| user.slug == slug}
    end
end
