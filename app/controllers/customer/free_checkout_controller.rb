class Customer::FreeCheckoutController < CustomersController
  before_action :authenticate_customer!
  before_action :set_customer_to_order

  def show
    @order = current_order
  end

  private

    def set_customer_to_order
      @customer_order = current_order
      @customer_order.update(customer: current_customer)
    end
end