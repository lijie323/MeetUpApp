class User < ActiveRecord::Base
  attr_accessible :age, :country, :email, :gender, :name, :password, :password_confirmation, :zip, :image
  has_secure_password
  validates_presence_of :name, :password, :password_confirmation, :email
  validates_uniqueness_of :email, :name
  mount_uploader :image, ImageUploader

  before_validation :convert_email
  after_create :send_welcome_email
  after_destroy :send_delete_email

  has_many :group
  has_many :comment, :dependent => :destroy
  has_many :membership, :dependent => :destroy



  def convert_email
    self.email = self.email.downcase
  end

  validates_format_of :email, :with => /^(|(([A-Za-z0-9]+_+)|([A-Za-z0-9]+\-+)|([A-Za-z0-9]+\.+)|([A-Za-z0-9]+\++))*[A-Za-z0-9]+@((\w+\-+)|(\w+\.))*\w{1,63}\.[a-zA-Z]{2,6})$/i

  def send_welcome_email
    UserMailer.welcome_email(self).deliver
  end

  def send_delete_email
    UserMailer.delete_email(self).deliver
  end
end
