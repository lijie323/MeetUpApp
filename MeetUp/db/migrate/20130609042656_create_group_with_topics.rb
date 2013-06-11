class CreateGroupWithTopics < ActiveRecord::Migration
  def change
    create_table :group_with_topics do |t|
      t.integer :groupid
      t.integer :topicid

      t.timestamps
    end
  end
end
