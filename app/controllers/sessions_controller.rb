class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      flash[:success] = 'You have been successfully logged in'
      redirect_to articles_path
    else
      flash.now[:danger] = 'There is something wrong with your account'
      render 'new'
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:success] = 'You have been successfully logged out'
    redirect_to root_path
  end
end