class User < ActiveRecord::Base
    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    has_many :teams
    has_many :champions, through: :teams
    has_secure_password
end
