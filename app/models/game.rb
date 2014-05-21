class Game < ActiveRecord::Base
  has_many :game_ownerships
  has_many :users, :through => :game_ownerships
  has_many :platform_appearances
  has_many :platforms, :through => :platform_appearances

  # validates_uniqueness_of :title, scope: :current_user

  GiantBomb::Api.key(ENV.fetch('GIANTBOMB_API'))

  # Get list of games with platforms
  # map platforms to just names
  # check against whitelist
  # accept game if at least one platform is in whitelist
  # ---
  # Filter out bad platforms so they don't
  # show up in select element

  def self.games_search(query)
    giant_bomb_results = giant_bomb_generic_search(query)
    parse_giant_bomb_results(giant_bomb_results)
  end

  def self.giant_bomb_generic_search(query)
    game_title = query.downcase
    search = GiantBomb::Search.new
    search.resources('game')
    search.query(game_title)
    search.fields('name,deck,id,platforms')
    search.fetch
  end

  def self.parse_giant_bomb_results(results)
    search_results = results.map do |game|
      {
        :title => game['name'],
        :deck => game['deck'],
        :id => game['id'],
        :platforms => platform_names(game['platforms'])
      }
    end
    search_results.reject! do |result|
      result[:platforms].none? { |platform| Platform::WHITELIST.include?(platform) }
    end
    return search_results
  end

  def self.giant_bomb_specific_search(id)
    GiantBomb::Game.detail(id.to_i)
  end

  def self.game_page(id)
    @game = giant_bomb_specific_search(id)
    parse_giant_bomb_specific_results(@game)
  end

  def self.parse_giant_bomb_specific_results(game)
    platform_names = platform_names(game.platforms).select do |x|
      Platform::WHITELIST.include?(x)
    end
    @result =
    {
      :title => game.name,
      :description => game.deck,
      :id => game.id,
      # :release_date => @game.original_release_date.gsub(' 00:00:00', ''),
      :image_url => game.image['medium_url'],
      :publisher => game.publishers[0]['name'],
      # :developer => @game.developers[0]['name'],
      :platform => platform_names
    }

    if game.original_release_date
      @result[:release_date] = game.original_release_date.gsub(' 00:00:00', '')
    end

    if game.developers
      @result[:developer] = game.developers[0]['name']
    end

    if game.genres
      @result[:genre] = game.genres[0]['name']
    end

    return @result
  end

  def self.platform_names(game_platforms)
    game_platforms.map { |x| x['name'] } rescue []
  end

end
