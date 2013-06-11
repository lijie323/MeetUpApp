class Comment < ActiveRecord::Base
  attr_accessible :content, :meetup_id, :user_id
  validates_presence_of :content, :meetup_id, :user_id
  belongs_to :user
  belongs_to :meetup
end
