class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update]
  before_action :correct_user, only: [:edit, :update]
  
  def show
    @user = User.find(params[:id])
    @microposts = @user.microposts.order(created_at: :desc)
  end
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = "Welcome to the Sapmple App!"
      redirect_to @user
    else
      render 'new'
    end # ここにendが必要です。
  end
  
  def edit
  end
  
  def update
    if @user.update(user_params)
      flash[:success] = "Update your profile"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :profile)
  end
  
  def correct_user
    redirect_to root_path if @user != current_user
  end
  
  def set_user
    @user = User.find(params[:id])
  end
end
