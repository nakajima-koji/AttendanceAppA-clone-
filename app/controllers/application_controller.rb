class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  include SessionsHelper
  
  $days_of_the_week = %w{日 月 火 水 木 金 土}
  
  def set_one_month
    @first_day = params[:date].nil? ?
    Date.current.beginning_of_month : params[:date].to_date
    @last_day = @first_day.end_of_month
    one_month = [*@first_day..@last_day]
    
    @attendance_systems = @user.attendance_systems.where(worked_on: @first_day..@last_day).order(:worked_on)
    
    unless one_month.count == @attendance_systems.count
      ActiveRecord::Base.transaction do
        one_month.each { |day| @user.attendance_systems.create!(worked_on: day) }
      end
       @attendance_systems = @user.attendance_systems.where(worked_on: @first_day..@last_day).order(:worked_on)
    end
    
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = "ページ所得に失敗しました。再アクセスしてください。"
    redirect_to root_url
  end
end
