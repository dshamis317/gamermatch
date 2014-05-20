class GamesController < ApplicationController

  before_action :authorize, only: [:create, :destroy, :detail]

  def index
    @games = Game.all
  end

  def search
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
    platform_id = PlatformAppearance.find_by(game_id: params[:id]).platform_id
    @platform = Platform.find(platform_id)
  end

  def create
    @user = current_user
    platform = Platform.find_or_create_by(platform_name: platform_params.fetch(:platform_name))
    @user.platforms << platform if @user.platforms.where(platform_name: platform.platform_name).length.zero?
    game = Game.find_or_create_by(game_params)
    appearance = PlatformAppearance.create(game: game, platform: platform)
    @user.games << game if game.users.where(username: current_user.username).length.zero?

    redirect_to profile_path(current_user)
  end

  def destroy
    user = User.find(params[:user_id])
    Game.delete(params[:id])
    redirect_to profile_path(current_user)
  end

  def playing
    @game = Game.find(params[:id])
    @users = @game.users
  end

  private

  def game_params
    params.require(:game).permit(:title, :description, :release_date, :image_url, :publisher, :genre, :developer, :gb_id)
  end

  def platform_params
    params.require(:game).permit(:platform_name, :user_id)
  end

end
