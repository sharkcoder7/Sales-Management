module DealsHelper

  def savings(deal)
    number_to_currency(deal.item.price - deal.price) 
  end
end 