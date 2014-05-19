class User < ActiveRecord::Base
  has_secure_password

  has_many :game_ownerships
  has_many :games, :through => :game_ownerships
  has_many :platforms
end
