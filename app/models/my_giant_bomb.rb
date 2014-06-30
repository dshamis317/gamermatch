module MyGiantBomb

  API_KEY = GiantBomb::Api.key(ENV.fetch('GIANTBOMB_API'))

  class Search
    def self.generic(query)
      game_title = query.downcase
      search = GiantBomb::Search.new
      search.resources('game')
      search.query(game_title)
      search.fields('name,deck,id,platforms')
      search.fetch
    end

    def self.specific(id)
      GiantBomb::Game.detail(id.to_i)
    end

  end

  class Parse
    def self.generic(results)
      search_results = results.map do |game|
        {
         :title => game['name'],
         :deck => game['deck'],
         :id => game['id'],
         :platforms => platform_names(game['platforms'])
        }
      end
      search_results.select! do |result|
        result[:platforms].any? { |platform| Platform::WHITELIST.include?(platform) }
      end
      return search_results
    end

    def self.specific(game)
      platform_names = platform_names(game.platforms).select do |x|
        Platform::WHITELIST.include?(x)
      end
      @result =
        {
         :title => game.name,
         :description => game.deck,
         :id => game.id,
         :image_url => game.image['medium_url'],
         :publisher => game.publishers[0]['name'],
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

end
