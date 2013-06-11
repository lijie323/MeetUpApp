class FixColumnName2 < ActiveRecord::Migration
  def change
    rename_column :meetups, :groupid, :group_id
  end

  def down
  end
end
