class DealsController < ApplicationController
  helper_method :params
  require 'pry'
  
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

  def message
    deal = Deal.find(params[:id])
    render plain: deal.message
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
    if params[:item_id]
      @item = Item.find(params[:item_id])
      @deal = Deal.find(params[:id])
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @deal }
      end
    else
      @deal = Deal.find(params[:id])
      @item = Item.find(@deal.item_id)
      respond_to do |format|
        format.html { render :show }
        format.json { render json: @deal }
      end
    end
  end

  def under_fifty
    @deals = Deal.fifty
    render "index"
  end
  private
  def deal_params
    params.require(:deal).permit(
      :price,
      :name,
      :message,
      :item_id,
      :user_id
    )
  end 

end