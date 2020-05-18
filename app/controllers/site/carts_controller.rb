class Site::CartsController < SiteController

  def show
    @order_items = current_order.order_items
  end

end