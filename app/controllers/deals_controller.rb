class DealsController < ApplicationController

  def new
    @deal = Deal.new
  end

  def create
    deal = Deal.create(deal_params)
    redirect_to deal_path(deal)
  end

  def edit
    @deal = Deal.find_by(id: params[:id])
  end

  def index
    @deals = Deal.all
  end

  def show
    @deal = Deal.find_by(id: params[:id])
  end

  private
  def deal_params
    params.require(:deal).permit(
      :price,
      :amount,
      :message,
      :item_id
    )
  end 

end