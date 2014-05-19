class GamesController < ApplicationController

  before_action :authorize, only: [:create, :destroy, :detail]

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
    @games = Game.game_page(@game.gb_id)
  end

  def create
    @user = current_user
    platform = Platform.find_or_create_by(platform_params)
    new_game = Game.create(game_params)
    new_game.platforms << platform
    @user.games << new_game
    redirect_to profile_path(current_user)
  end

  def destroy
    user = User.find(params[:user_id])
    Game.delete(params[:id])
    redirect_to profile_path(current_user)
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_date, :image_url, :publisher, :genre, :developer, :gb_id)
  end

  def platform_params
    params.require(:game).permit(:platform_name, :user_id)
  end

end
