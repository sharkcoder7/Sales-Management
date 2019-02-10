class ItemsController < ApplicationController

  def new
    @item = Item.new

  end

  def create
    @item = Item.create(item_params)
    if @item.valid?
      @item.save
      redirect_to item_path(@item)
    else
      render :new
    end
  end

  def edit
    @item = Item.find_by(id: params[:id])
  end

  def index 
    @items = Item.all
    
  end

  def deals_index
    @item = Item.find(params[:id])
    @deals = @item.deals
    render template:'deals/index'
  end

  def show
    @item = Item.find(params[:id])
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
    @item = Item.find(params[:id])
    @deals = @item.deals
    render template: 'deal/show'
  end

  private
  def item_params
    params.require(:item).permit(
      :name,
      :description,
      :price,
      :category
    )
  end
end