class SessionsController < ApplicationController

  def new
    # Form
  end

  def create
    user = User.find_by(username: params[:username])

    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_path, notice: "Signed in as #{user.username}. Congrats!"
    else
      redirect_to log_in_path, alert: "Log-In failed, please try again."
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_path, notice: "Logged Out."
  end

end
