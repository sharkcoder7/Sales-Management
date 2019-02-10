class User < ApplicationRecord
  has_many :sales
  has_many :deals, :through => :sales

  has_secure_password

end
