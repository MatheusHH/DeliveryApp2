class Customer::OrdersController < CustomersController
  before_action :authenticate_customer!
  before_action :set_order, only: [:show]

  def index
    @orders = current_customer.orders.where(status: :fechado)
  end

  def show
  end

  private

    def set_order
      @order = Order.find(params[:id])
    end
end
