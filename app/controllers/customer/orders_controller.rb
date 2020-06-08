class Customer::OrdersController < CustomersController
  before_action :authenticate_customer!
  before_action :set_order, only: [:show]

  def index
    @orders = current_customer.orders.where(status: :fechado).page(params[:page]).per(5)
  end

  def show
    unless @order.customer.id == current_customer.id
      redirect_to customer_orders_path, alert: t("flash.unauthorized")
    end
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end
end
