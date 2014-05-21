class PlatformsController < ApplicationController

  def index
    @platforms = Platform.all
  end

  def show
    @platform = Platform.find(params[:id])
    @games = @platform.games
  end

end
