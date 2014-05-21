class PlatformsController < ApplicationController

  def index
    platforms = Platform.all
    @platforms = platforms.sort_by { |p| p.platform_name }
  end

  def show
    @platform = Platform.find(params[:id])
    @games = @platform.games
  end

end
