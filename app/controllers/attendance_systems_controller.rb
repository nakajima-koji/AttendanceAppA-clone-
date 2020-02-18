class AttendanceSystemsController < ApplicationController
  include AttendanceSystemsHelper
  before_action :set_user, only: [:edit_one_month, :update_one_month]
  before_action :logged_in_user, only: [:index, :update, :edit_one_month]
  before_action :set_one_month, only: [:edit_one_month]
  before_action :admin_or_correct_user, only: [:update, :edit_one_month, :update_one_month]
  
  UPDATE_ERROR_MSG = "勤務登録に失敗しました、やり直してください。"
  
  def index
    @users = User.all.includes(:attendance_systems)
  end
  
  def update
    @user = User.find(params[:user_id])
    @attendance_system = AttendanceSystem.find(params[:id])
    if @attendance_system.started_at.nil?
      if @attendance_system.update_attributes(started_at: Time.current.change(sec: 0))
        flash[:success] = "おはようございます"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    elsif @attendance_system.finished_at.nil?
      if @attendance_system.update_attributes(finished_at: Time.current.change(sec: 0))
        flash[:success] = "お疲れ様でした"
      else
        flash[:danger] = UPDATE_ERROR_MSG
      end
    end
    redirect_to @user
  end
  
  def edit_one_month
  end
  
  def update_one_month
    ActiveRecord::Base.transaction do
      if attendance_systems_invalid?
        attendance_systems_params.each do |id, item|
          attendance_system = AttendanceSystem.find(id)
          attendance_system.update_attributes!(item)
        end
        flash[:success] = "１月分の勤怠情報を更新しました。"
        redirect_to user_path(date: params[:date])
      else
        flash[:danger] = "無効な入力データがあったため、更新をキャンセルしました。"
        redirect_to attendance_systems_edit_one_month_user_path(date: params[:date])
      end
    end
  rescue ActiveRecord::RecordInvalid
    flash[:danger] = "無効な入力データがあったため、更新をキャンセルしました。"
    redirect_to attendance_systems_edit_one_month_user_path(date: params[:date])
  end
  
  private
    def attendance_systems_params
      params.require(:user).permit(attendance_systems: [:started_at, :finished_at, :note])[:attendance_systems]
    end
end
