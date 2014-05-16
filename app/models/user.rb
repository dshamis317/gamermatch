class User < ActiveRecord::Base
  has_many :games, :through => :game_ownerships
  has_many :platforms
end
