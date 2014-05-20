class UsersController < ApplicationController


  before_action :authorize, except: [:new, :create]

  def index
    @users = User.all
    @user = current_user
  end

  def create
    #platform = Platform.find_or_create_by(platform_params)
    @user = User.new(user_params)
    if @user.save
      platform = params[:user][:platform_name].map { |x| Platform.create(platform_name: x, user_id: @user.id) }
      @user.platforms << platform
      redirect_to root_path
    else
      render 'new'
    end
  end

  def new
    @user = User.new
    # Form
  end

  def edit
    @user = User.find(params[:id])
    # Form
  end

  def show
    @user = User.find(params[:id])
    @platforms = @user.platforms
    @games = @user.games
  end

  def update
    edited_user = User.find(params[:id])
    edited_user.update(user_params)
    redirect_to profile_path(current_user)
  end

  def destroy
    User.delete(params[:id])
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:username, :email, :email_confirmation, :age, :location, :phone_number, :password, :password_confirmation)
  end

  def platform_params
    params.require(:user).permit(:platform_name)
  end

end
