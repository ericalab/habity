class SessionsController < ApplicationController
  include SessionHelper
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      remember user #SessionHelper
      redirect_to habits_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render :new
    end
  end
  
  def destroy
    log_out if logged_in?
    redirect_to root_url, into: 'ログアウトしました'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, 
:password_confirmation)
  end

end
