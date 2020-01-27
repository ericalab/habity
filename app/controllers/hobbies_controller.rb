require 'csv'
class HobbiesController < ApplicationController
  
  def index
    @categories = Category.joins(:hobbies).where(hobbies: {user_id: current_user}).uniq
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
    hobby=Hobby.find(params[:id])
    hobby.delete
    redirect_to hobbies_path, success: "Deleted it successfully!"
  end
  
  def csv_output
    @hobbies = Hobby.where(user_id: current_user, category_id: params[:category_id])
    respond_to do |format|
      format.html do
          #html用の処理を書く
      end 
      format.csv do
          #csv用の処理を書く
          send_data render_to_string, filename: "hobbies.csv", type: :csv
      end
    end
  end
  
  private
    def hobby_params
      params.require(:hobby).permit(:title, :impression, :category_id)
    end
end
