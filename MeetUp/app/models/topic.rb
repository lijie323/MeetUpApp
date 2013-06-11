class Topic < ActiveRecord::Base
  attr_accessible :name

  has_many :group_with_topic, :dependent => :destroy
end
