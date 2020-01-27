class HabitsController < ApplicationController

  def index
    @daily_habit = DailyHabit.all
    @weekly_habit = WeeklyHabit.all
  end
  
  def new_daily
    @habit = DailyHabit.new
  end
  
  def new_weekly
    @habit = WeeklyHabit.new
  end
  
  def create_daily
    @habit = current_user.daily_habits.new(daily_habit_params)
    if @habit.save
      flash[:success] = "Registerd your new habits successfully!"
      redirect_to habits_path
    else
      flash.now[:danger] = "Registration failed... :("
      render :new_daily
    end
  end
  
  def create_weekly
    @habit = current_user.weekly_habits.new(weekly_habit_params)
    if @habit.save
      flash[:success] = "Registerd your new habits successfully!"
      redirect_to habits_path
    else
      flash.now[:danger] = "Registration failed... :("
      render :new_weekly
    end
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
    if  !params[:achievement_daily].nil?
       params[:achievement_daily].each do |key, d_a|
        if DailyAchievement.find_by(daily_habit_id: d_a.to_i, created_at: Time.zone.now.all_day).nil?
          current_user.daily_achievements.create(daily_habit_id: d_a.to_i)
        end
       end
    end
    
    if  !params[:achievement_weekly].nil?
      params[:achievement_weekly].each do |key, w_a|
        if WeeklyAchievement.find_by(weekly_habit_id: w_a.to_i, created_at: 1.week.ago..Date.today.end_of_day).nil?
          current_user.weekly_achievements.create(weekly_habit_id: w_a.to_i)
        end
      end
    end
    redirect_to habits_path, success: "Way to go!"
  end
  
  def daily_destroy
    habit=DailyHabit.find(params[:id])
    habit.daily_achievements.delete_all
    habit.delete
    redirect_to habits_path, success: "Your daily habit has been deleted it!"
  end
  
  def weekly_destroy
    habit=WeeklyHabit.find(params[:id])
    habit.weekly_achievements.delete_all
    habit.delete
    redirect_to habits_path, success: "Your weekly habit has been deleted it!"
  end
  
  
  private
  def daily_habit_params
    params.fetch(:daily_habit).permit(:name)
  end
  def weekly_habit_params
    params.fetch(:weekly_habit).permit(:name)
  end

end
