class Deal < ApplicationRecord
  belongs_to :item
  belongs_to :store
  has_many :sales
  has_many :users, :through => :sales

end
