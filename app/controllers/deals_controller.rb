class DealsController < ApplicationController

  def new
    @item = Item.find(params[:item_id])
    @deal = Deal.new(item_id: params[:item_id])
  end

  def create

    @item = Item.find(deal_params[:item_id])
    @deal = Deal.new(deal_params)
    @deal.item_id = @item.id
    if @deal.valid?
      @deal.save
      redirect_to item_deal_path(@deal.item_id, @deal)
    else
      render :new
    end
  end

  def edit
    @deal = Deal.find(params[:id])
  end

  def index
    if params[:item_id]
      @item = Item.find(params[:item_id])
      @deals = @item.deals
    else
      @deals = Deal.all
    end
  end

  def show
    @item = Item.find(params[:item_id])
    @deal = Deal.find(params[:id])
  end

  private
  def deal_params
    params.require(:deal).permit(
      :price,
      :amount,
      :message,
      :item_id,
      :user_id
    )
  end 

end