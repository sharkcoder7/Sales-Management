class ItemsController < ApplicationController
  before_action :set_item, only: [:show, :edit, :update, :destroy, :deals_index]


  def new
    @item = Item.new
  end

  def create
    @item = Item.create(item_params)
    render json: @item, status: 201
  end

  def edit

  end

  def index 
    @items = Item.all
  end


  def show
    @deal = Deal.create 
    @deals = @item.deals
    respond_to do |format|
      format.html { render :show }
      format.json { render json: @item }
    end
  end
  
  def update
    item = Item.find_by(id: params[:id])
    item.update(params)
    redirect_to item_path(item)
  end

  def deals_index
    @deals = @item.deals
    render template: 'deal/show'
  end

  private
  
  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :category
    )
  end
end