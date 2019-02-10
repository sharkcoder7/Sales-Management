class User < ActiveRecord::Base

  has_many :deals
  has_many :items, :through => :deals

  has_secure_password

  validates :name, presence: true
  validates :email, presence: true
  validates :password, presence: true

end
