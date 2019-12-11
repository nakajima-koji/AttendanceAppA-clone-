module AttendanceSystemsHelper
  def working_times(start, finish)
    format("%.2f", (((finish - start) / 60) / 60.0))
  end
  
  def attendance_system_state(attendance_system)
    if Date.current == attendance_system.worked_on
      return "出社" if attendance_system.started_at.nil?
      return "退社" if attendance_system.started_at.present? && attendance_system.finished_at.nil?
    end
    false
  end
end