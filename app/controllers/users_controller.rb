class UsersController < ApplicationController
  before_action :set_user, only: [:edit, :show, :update]
  before_action :require_same_user, only: [:edit, :update]
  before_action :require_admin, only: [:destroy]

  def new
    @user = User.new
  end

  def index
    @users = User.paginate(page: params[:page], per_page: 5)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      flash[:success] = "Welcome to the alpha blog #{@user.username}"
      redirect_to user_path(@user)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @user.update(user_params)
      flash[:success] = 'Your account has been edited successfully'
      redirect_to user_path(@user)
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:destroy] = 'This user has been destroyed'
    redirect_to users_path
  end

  private
  def user_params
    params.require(:user).permit(:username, :email, :password)
  end

  def set_user
    @user = User.find params[:id]
  end

  def require_same_user
    if current_user != @user
      flash[:danger] = 'Only user who create article can edit or delete it'
      redirect_to users_path
    end
  end

  def require_admin
    if !current_user.admin?
      flash[:danger] = 'Only admin can delete user and all articles'
      redirect_to users_path
    end

  end

end