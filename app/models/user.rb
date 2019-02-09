class Users < ActiveRecord::Base
  has_many :sales
  has_many :items, :through => :sales

  has_secure_password

end
