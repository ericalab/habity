class HobbiesController < ApplicationController
  
  def index
  end 
    
  def new
    @hobby = Hobby.new
  end 
  
  def create
    @hobby = current_user.hobbies.build(hobby_params)
    if @hobby.save
      flash[:success] = "Logged it successfully!"
      redirect_to hobbies_path
    else
      flash.now[:danger] = "Failed to record... :("
      render :new
    end
  end
  
  def destroy
  end
  
  private
    def hobby_params
      params.require(:hobby).permit(:title, :impression, :category_id)
    end
end
