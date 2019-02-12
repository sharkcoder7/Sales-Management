class Item < ApplicationRecord
  has_many :deals
  has_many :users, :through => :deals
  accepts_nested_attributes_for :deals

  validates :name, presence: true
  validates :price, presence: true
  validates :description, presence: true
  validates :category, presence: true


  @@categories = ['Appliances', 'Electronics', 'Apparel']

  def self.categories
    @@categories
  end


end
