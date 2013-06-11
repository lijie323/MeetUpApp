class CreateGroups < ActiveRecord::Migration
  def change
    create_table :groups do |t|
      t.string :name
      t.string :description
      t.string :country
      t.integer :zip
      t.integer :user_id

      t.timestamps
    end
  end
end
