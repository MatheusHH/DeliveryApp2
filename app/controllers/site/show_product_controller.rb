class Site::ShowProductController < SiteController

  def show
    @product = Product.find(params[:id])
  end
end