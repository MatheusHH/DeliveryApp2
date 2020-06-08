class Admin::ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :set_category, only: [:edit, :update, :new, :create]

  def index
    @products = Product.all.page(params[:page]).per(5)
  end

  def new
    @product = Product.new
  end

  def show
  end

  def edit
  end

  def create
    @product = Product.new(product_params)
    @product.user = current_user
    respond_to do |format|
      if @product.save
        format.html { redirect_to admin_products_url, notice: t('flash.actions.create.notice(a)', model: @product.model_name.human) }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to admin_products_url, notice: t('flash.actions.update.notice(a)', model: @product.model_name.human) }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to admin_products_url, notice: t('flash.actions.destroy.notice') }
      format.json { head :no_content }
    end
  end

  private
    def set_product
      @product = Product.find(params[:id])
    end

    def set_category
      @category = Category.new
    end

    def product_params
      params.require(:product).permit(:image, :name, :description, :price, :status, :category_id, :user_id )
    end
end
