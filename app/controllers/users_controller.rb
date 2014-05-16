class UsersController < ApplicationController

  before_action:current_user

# GET    /users(.:format)                         users#index
  def index
    @users = User.all
    @user = current_user
  end

# POST   /users(.:format)                         users#create
# GET    /users/new(.:format)                     users#new
# GET    /users/:id/edit(.:format)                users#edit
# GET    /users/:id(.:format)                     users#show
  def show
    @user = User.find(params[:id])
    @games = @user.games
  end
# PATCH  /users/:id(.:format)                     users#update
# PUT    /users/:id(.:format)                     users#update
# DELETE /users/:id(.:format)                     users#destroy

end
