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
      flash[:success] = "Welcome to Habity!"
      redirect_to habits_path
    else
      flash.now[:danger] = "Signup failed... :("
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, into: 'ログアウトしました'
  end
  
  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end
end
