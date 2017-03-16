class UsersController < ApplicationController
  
  def show
    @user = User.find(params[:id])
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
    if  @user = User.find(params[:id])
      　redirect_to root_path unless(current_user == @user)
    else
       render 'edit'
    end
  
  def update
    if @user.update_attributes(user_params)
      redirect_to @user
      flash[:success] = "Update your profile"
    else
      render'edit'
    end # ここにendが必要です。
    
# end # classをここで閉じてしまっていますので、これはいりません。
  
  private

  def user_params
    params.require(:user).permit(:name, :email, :password,
                                 :password_confirmation, :area, :profile)
  end
# end # このendはいりません。
end