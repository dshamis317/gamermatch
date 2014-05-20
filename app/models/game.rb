class Game < ActiveRecord::Base
  has_many :game_ownerships
  has_many :users, :through => :game_ownerships
  has_many :platform_appearances
  has_many :platforms, :through => :platform_appearances

  # validates_uniqueness_of :title, scope: :current_user

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
    @result =
    {
      :title => @game.name,
      :description => @game.deck,
      :id => @game.id,
      # :release_date => @game.original_release_date.gsub(' 00:00:00', ''),
      :image_url => @game.image['medium_url'],
      :publisher => @game.publishers[0]['name'],
      :developer => @game.developers[0]['name'],
      :platform => @game.platforms
    }

    if @game.original_release_date
      @result[:release_date] = @game.original_release_date.gsub(' 00:00:00', '')
    end

    if @game.genres
      @result[:genre] = @game.genres[0]['name']
    end

    return @result
  end

end
