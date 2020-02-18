class RenameTypeColumnToBases < ActiveRecord::Migration[5.1]
  def change
    rename_column :bases, :type, :bases_type
  end
end
