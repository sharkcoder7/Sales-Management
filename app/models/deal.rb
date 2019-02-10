class Deal < ApplicationRecord
  belongs_to :item
  has_many :sales
  has_many :users, :through => :sales



end
