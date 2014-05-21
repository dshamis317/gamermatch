class PlatformsController < ApplicationController

  def platforms
    @platforms = Platform.all
  end

  def onplatforms
    @platform = Platform.find(params[:id])
    @games = @platform.games
  end

end
