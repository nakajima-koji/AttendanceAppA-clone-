class AddPlanEndTimeToAttendanceSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_systems, :plan_end_time, :datetime
  end
end
