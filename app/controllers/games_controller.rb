class GamesController < ApplicationController

  before_action:current_user

  def index
    @user = current_user
    @games = @user.games
  end

  def search
    @games = Game.games_search(params["name"])
  end

  def show
    @games = Game.game_page(params[:id])
  end

  def detail
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
  end

  def create
    new_game = Game.create(params.require('game').permit(:title, :description, :release_date, :image_url, :publisher, :genre, :developer, :platform))
    @current_user.games << new_game
    redirect_to '/users/'
  end

  def destroy
    user = User.find(params[:user_id])
    Game.delete(params[:id])
    redirect_to "/users/#{user.id}/games"
  end

end
