class GamesController < ApplicationController

  before_action:current_user

  def search
    @games = Game.games_search(params["name"])
  end

end
