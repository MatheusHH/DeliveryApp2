class Site::ByCategoryController < SiteController
  before_action :load_categories

  def show
    @products = Product.where(category_id: params[:id])
  end

  private
   
   def load_categories
     @categories = Category.all
   end
end
