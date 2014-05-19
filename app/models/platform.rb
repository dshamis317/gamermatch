class Platform < ActiveRecord::Base
  belongs_to :user
  has_many :platform_appearances
  has_many :games, through: :platform_appearances
end
