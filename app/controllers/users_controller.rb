class UsersController < ApplicationController

  before_action:current_user

  def index
    @users = User.all
    @user = current_user
  end

  def create
    user = User.create(user_params)
    redirect_to users_path
  end

  def new
    @user = current_user
    # Form
  end

  def edit
    @user = User.find(params[:id])
    # Form
  end

  def show
    @user = User.find(params[:id])
    @games = @user.games
  end

  def update
    edited_user = User.find(params[:id])
    edited_user.update(user_params)
    redirect_to "/users/#{edited_user.id}/games"
  end

  def show
    @user = current_user
    @games = @user.games
  end

  def destroy
    User.delete(params[:id])
    redirect_to users_path
  end

  private

  def user_params
    params.require('user').permit(:username, :email, :age, :location, :phone_number)
  end

end
