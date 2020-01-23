class SessionsController < ApplicationController
  include SessionHelper
  
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      log_in user
      redirect_to habits_path, success: 'ログインに成功しました'
    else
      flash.now[:danger] = 'Invalid email/password combination' 
      render :new
    end
  end
  
  def destroy
    log_out
    redirect_to root_url, into: 'ログアウトしました'
  end
  
  private
  
  def user_params
    params.require(:user).permit(:name, :email, :password, 
:password_confirmation)
  end
  
  def log_out
    session.delete(:user_id)
    @current_user = nil
  end

end
