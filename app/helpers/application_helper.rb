module ApplicationHelper
  def current_order
    if !session[:order_id].nil?
      Order.find(session[:order_id])
    else
      Order.new
    end
  end

  def total_items_cart(cart)
    total = 0
    cart.order_items.each do |item|
      total += item.quantity
    end
    total
  end
end
