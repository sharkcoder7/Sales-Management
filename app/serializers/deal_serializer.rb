class DealSerializer < ActiveModel::Serializer
  attributes :id, :price, :name, :item_id, :user_id, :message
  belongs_to :item
  belongs_to :user
end
