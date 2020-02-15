class AddDesignatedTimeToAttendanceSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_systems, :designated_work_start_time, :datetime, default: false
    add_column :attendance_systems, :designated_work_end_time, :datetime, default: false
  end
end
