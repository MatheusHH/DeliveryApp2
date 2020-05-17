class Customer::OrdersController < CustomersController
  before_action :authenticate_customer!

  def index
  end
end
