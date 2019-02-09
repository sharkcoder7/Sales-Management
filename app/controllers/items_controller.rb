class ItemsController < ApplicationController

  def create
    item = Item.create(item_params)
    
  end

  private
  def item_params
    params.require(:item).permit(
      :name
      :description
      :price
      :catagory
    )
  end
end