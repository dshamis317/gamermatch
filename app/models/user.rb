class User < ActiveRecord::Base
  has_secure_password
  validates :username, presence: true, uniqueness: true, :length => {:within => 6..20, :wrong_length => "needs to be between 6 and 20 characters"}
  validates :age, presence: true
  validates :location, presence: true
  validates :phone_number, presence: true
  validates :email, confirmation: true, uniqueness: true
  validates :password, :length => {:within => 8..20, :wrong_length => "needs to be between 8 and 20 characters"}

  has_many :game_ownerships
  has_many :games, :through => :game_ownerships
  has_many :platforms
end
