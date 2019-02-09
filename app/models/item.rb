class Item < ActiveRecord::Base
  has_many :sales
  has_many :users, :through => :sales

  
end
