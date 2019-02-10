class Item < ApplicationRecord
  has_many :deals
  accepts_nested_attributes_for :deals


  @@categories = ['Appliances', 'Electronics', 'Apparel']

  def self.categories
    @@categories
  end


end
