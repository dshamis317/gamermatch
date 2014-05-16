class Game < ActiveRecord::Base
  has_many :users, :through => :game_ownerships
  belongs_to :platform
  has_one :title

  GiantBomb::Api.key('1a0effe0dad7cdafec30c79bceba8607dec50647')

  def self.games_search(query)
    game_title = query.downcase
    @search = GiantBomb::Search.new
    @search.resources('game')
    @search.query(game_title)
    @search.fields('name,deck,id')
    game = @search.fetch
    search_results = game.map do |game|
      {
        :title => game['name'],
        :deck => game['deck'],
        :id => game['id']
      }
    end
    return search_results
  end

  def self.game_page(id)
    id = id.to_i
    @game = GiantBomb::Game.detail(id)
    search_results = @game.map do |game|
      {
        :title => game.name,
        :deck => game.deck,
        :id => game.id,
        :rel_date => game.original_release_date,
        :image_url => game.image['medium_url'],
        :publisher => game.publishers[0]['name'],
        :genre => game.genres[0]['name']
      }
    end
    return search_results
  end

end
