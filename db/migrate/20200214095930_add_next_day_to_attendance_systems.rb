class AddNextDayToAttendanceSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_systems, :next_day, :boolean
  end
end
