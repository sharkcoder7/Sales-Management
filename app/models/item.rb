class Item < ApplicationRecord
  has_many :deals
  has_many :stores, :through => :deals
  
  
end
