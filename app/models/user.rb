class User < ActiveRecord::Base


  # before_save { self.email = email.downcase }
  # validates :name, presence: true, length: { maximum: 50 }
  # validates :email, presence: true, length: { maximum: 255 }


  has_secure_password
  # validates :password, presence: true, length: { minimum: 6 }
  has_many :favorites


  def self.authenticate email, password
    User.find_by_email(email).try(:authenticate, password)
  end




end


