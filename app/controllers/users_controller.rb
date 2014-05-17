class UsersController < ApplicationController

  before_action:current_user

def index
  @users = User.all
  @user = current_user
end

def create
  user = User.create(user_params)
  redirect_to "/users"
end

def new
  @user = current_user
end

# GET    /users/:id/edit(.:format)                users#edit

def show
  @user = User.find(params[:id])
  @games = @user.games
end

# PUT    /users/:id(.:format)                     users#update

# DELETE /users/:id(.:format)                     users#destroy

private

def user_params
  params.require('user').permit(:username, :email, :age, :location, :phone_number)
end

end
