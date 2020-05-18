class Site::ShowProductController < SiteController
  before_action :load_order_item

  def show
    @product = Product.find(params[:id])
  end

  private

   def load_order_item
     @order_item = current_order.order_items.new
   end
end