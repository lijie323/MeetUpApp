class Group < ActiveRecord::Base
  attr_accessible :country, :description, :name, :user_id, :zip
  validates_presence_of :name, :user_id, :country, :zip
  belongs_to :user
  has_many :group_with_topic, :dependent => :destroy
  has_many :meetup, :dependent => :destroy

end
