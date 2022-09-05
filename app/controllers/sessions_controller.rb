class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user.present? && user.authenticate(params[:password])
      session[:user_id] = user.id
      flash[:success] = "Logged in !"
      redirect_to root_path
    else
      flash.now[:danger] = "Email or password is incorrect"
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:info] = "Disconnected"
    redirect_to root_path
  end
end
