class Item < ApplicationRecord
  has_many :deals
  accepts_nested_attributes_for :deals


  @@catagories = ['Appliances', 'Electronics', 'Apparel']

  def self.catagories
    @@catagories
  end


end
