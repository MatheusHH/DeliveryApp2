class Site::ShoppingsController < ApplicationController
  layout 'customer_layout'
  before_action :load_categories

  def index
    @products = Product.all
  end

  private

   def load_categories
     @categories = Category.order(:name)
   end
end