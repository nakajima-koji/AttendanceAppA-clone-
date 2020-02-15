class AddProcessToAttendanceSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_systems, :process, :string
  end
end
