class Users < ApplicationRecord
  has_many :sales
  has_many :items, :through => :sales

  has_secure_password

end
