class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :group_with_topics, :groupid, :group_id
    rename_column :group_with_topics, :topicid, :topic_id
  end

  def down
  end
end
