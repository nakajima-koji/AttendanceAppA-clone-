class RemoveDesignatedWorkEndTimeToAttendanceSystem < ActiveRecord::Migration[5.1]
  def change
    remove_column :attendance_systems, :designated_work_end_time, :string
  end
end
