class Game < ActiveRecord::Base
  has_many :game_ownerships
  has_many :users, :through => :game_ownerships
  has_many :platform_appearances
  has_many :platforms, :through => :platform_appearances

  def self.games_search(query)
    giant_bomb_results = MyGiantBomb::Search.generic(query)
    MyGiantBomb::Parse.generic(giant_bomb_results)
  end

  def self.game_page(id)
    @game = MyGiantBomb::Search.specific(id)
    MyGiantBomb::Parse.specific(@game)
  end
end
