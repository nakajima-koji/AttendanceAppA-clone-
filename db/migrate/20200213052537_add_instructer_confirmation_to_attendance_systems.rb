class AddInstructerConfirmationToAttendanceSystems < ActiveRecord::Migration[5.1]
  def change
    add_column :attendance_systems, :instructer_confirmation, :string
  end
end
