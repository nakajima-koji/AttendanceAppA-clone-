class AttendanceSystemsController < ApplicationController
  UPDATE_ERROR_MSG = "勤務登録に失敗しました、やり直してください。"
  
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
end
