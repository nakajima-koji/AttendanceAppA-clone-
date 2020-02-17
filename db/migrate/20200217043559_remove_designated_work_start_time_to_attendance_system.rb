class RemoveDesignatedWorkStartTimeToAttendanceSystem < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendance_systems, :designated_work_start_time, :string
  end
end
