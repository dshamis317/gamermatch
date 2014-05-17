class GamesController < ApplicationController

  before_action:current_user

  def index
    @user = current_user
    @games = Game.all
  end

  def search
    @user = current_user
    @games = Game.games_search(params["name"])
  end

  def show
    @user = current_user
    @gb_id = params[:id]
    @games = Game.game_page(@gb_id)
  end

  def detail
    @user = User.find(params[:user_id])
    @game = Game.find(params[:id])
  end

  def create
    binding.pry
    @user = current_user
    new_game = Game.create(params.require('game').permit(:title, :description, :release_date, :image_url, :publisher, :genre, :developer, :platform))
    @current_user.games << new_game
    redirect_to "/users/#{@user.id}/games"
  end

  def destroy
    user = User.find(params[:user_id])
    Game.delete(params[:id])
    redirect_to "/users/#{user.id}/games"
  end

end
