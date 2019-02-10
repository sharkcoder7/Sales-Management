class User < ActiveRecord::Base

  has_many :sales
  has_many :deals, :through => :sales

  has_secure_password


end
