class Meetup < ActiveRecord::Base
  attr_accessible :discription, :group_id, :location, :time, :title
  validates_presence_of :title, :time, :group_id
  belongs_to :group
  has_many :comment, :dependent => :destroy

end
