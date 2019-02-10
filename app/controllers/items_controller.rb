class ItemsController < ApplicationController

  def new
    @item = Item.new
  end

  def create
    item = Item.create(item_params)
    redirect_to item_path(item)
  end

  def index
    @items = Item.all
  end

  def show
    @item = Item.find_by(id: params[:id])

  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :catagory,
    )
  end
end