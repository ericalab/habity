class HobbysController < ApplicationController
  
  def index
    @hobby = Hobby.find_by(user_id: current_id)
  end 
    
  def new
    @hobby = Hobby.new
  end 
  
  def create
    @hobby = @current_user.hobbys.new(hobby_params)
    
    if @hobby.save
      redirect_to "#", success: '投稿に成功しました'
    else
      flash.now[:danger] = "投稿に失敗しました"
      render :new
    end
  end
  
  def destroy
  end
  
  private
    def hobby_params
      params.require(:hobby).permit(:title, :impression)
    end
end
