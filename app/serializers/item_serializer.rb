class ItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :category, :price
  has_many :deals, serializer: SimpleDealSerializer
end
