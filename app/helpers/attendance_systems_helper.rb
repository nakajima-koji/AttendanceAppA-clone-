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
  
  def attendance_systems_invalid?
    attendance_systems = true
      attendance_systems_params.each do |id,item|
        if item[:started_at].blank? && item[:finished_at].blank?
          next
        elsif item[:started_at].blank? || item[:finished_at].blank?
          attendance_systems = false
          break
        elsif item[:started_at] > item[:finished_at]
          attendance_systems = false
          break
        else
          attendance_systems = true
          break
        end
      end
    return attendance_systems
  end
end