class Site::ShoppingsController < SiteController
  before_action :load_categories
  before_action :products_for_carousel

  def index
    @products = Product.where(status: :ativo) 
  end

  private

    def load_categories
      @categories = Category.order(:name)
    end

    def products_for_carousel
      @products_sample = Product.limit(3).order("RANDOM()")
    end

   #def load_order_item
   #  @order_item = current_order.order_items.new
   #end
end