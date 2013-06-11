class CreateMeetups < ActiveRecord::Migration
  def change
    create_table :meetups do |t|
      t.string :title
      t.datetime :time
      t.string :discription
      t.string :location
      t.integer :groupid

      t.timestamps
    end
  end
end
