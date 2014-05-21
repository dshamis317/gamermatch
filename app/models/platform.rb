class Platform < ActiveRecord::Base
  belongs_to :user
  has_many :platform_appearances
  has_many :games, through: :platform_appearances

  validates :platform_name, uniqueness: {scope: :user_id}, platform_type: true

  WHITELIST = [
    "Android",
    "iPhone",
    "iPad",
    "PlayStation 3",
    "PlayStation 4",
    "PlayStation Vita",
    "PlayStation Network (PS3)",
    "PlayStation Network (Vita)",
    "PlayStation Network (PS4)",
    "Xbox 360",
    "Xbox One",
    "PC",
    "Mac"
  ]

end
