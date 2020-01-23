class HabitsController < ApplicationController

  def index
    @daily_habit = DailyHabit.all
    @weekly_habit = WeeklyHabit.all
  end
  
  def new
    @habit = DailyHabit.new
  end
  
  def create
    @habit = current_user.habits.new(habit_params)
    if @habit.save!
      flash[:success] = "Registerd your new habits successfully!"
      redirect_to habits_path
    else
      flash.now[:danger] = "Registration failed... :("
      render :new
    end
  end
  
  def update
    a
  end
  
  def save_achievement
   
    achievement_daily = params[:achievement_daily]
    achievement_weekly = params[:achievement_weekly]
    habit_id_daily = achievement_params[:habit_id_daily]
    habit_id_weekly = achievement_params[:habit_id_weekly]
    
    user_id = current_user[:id]
    
    achievement_daily.each do |key,value|
      habit_id = habit_id_daily[:key]
    end
    
    @daily_achievment = current_user.daily_achievements.new
    
    if daily_achievment.save!
      flash[:success] = "Way to go!"
      redirect_to habits_path
    else
      flash.now[:danger] = "It failed... :("
      render :new
    end
    
    
    achievement_weekly.each do |key,value|
      habit_id = habit_id_weekly[:key]
    end
    
    
    @weekly_achievment = current_user.weekly_achievements.new
    
    if weekly_achievment.save!
      flash[:success] = "You are the best!"
      redirect_to habits_path
    else
      flash.now[:danger] = "It failed... :("
      render :new
    end
  end
  
  def
  # def daily_count
  #   @daily_total = current_user.habits.daily_total
  #   if daily_total.update
  #     @daily_total += 1
  #   end
  # end
      

  def destroy
    @habit = Habit.find_by()
  end
  
  
  private
  def habit_params
    params.fetch(:habit).permit(:daily,:weekly)
  end
  
  def achievement_params
    params.permit(habit_id_daily: [], habit_id_weekly: [])
  end

  
  
end
