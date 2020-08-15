class Site::OrderItemsController < SiteController
  before_action :set_current_order

  def create 
    @order_item = @order.order_items.find_by(product_id: params[:order_item][:product_id])
    @order_item ||= @order.order_items.new(order_item_params)
    @order_item.update(order_item_params)
    @order.save
    session[:order_id] = @order.id
  end

  def update  
    @order_item = @order.order_items.find(params[:id])
    @order_item.update(order_item_params)
    @order.save
    @order_items = current_order.order_items
  end

  def destroy  
    @order_item = @order.order_items.find(params[:id])
    @order_item.destroy
    @order.save
    @order_items = current_order.order_items
  end


  private
   
  def order_item_params
    params.require(:order_item).permit(:product_id, :quantity)
  end

  def set_current_order
    @order = current_order
  end
end