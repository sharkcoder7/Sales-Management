class DealSerializer < ActiveModel::Serializer
  attributes :id, :price, :name, :item_id, :user_id, :message
end
