class GroupWithTopic < ActiveRecord::Base
  attr_accessible :group_id, :topic_id
  belongs_to :group
  belongs_to :topic

  validates_uniqueness_of  :group_id, :scope => :topic_id
end
