class Customer::DeliveriesController < CustomersController
  before_action :authenticate_customer!
  before_action :set_order, only: [:index]

  def index
    @delivery = @order.delivery
  end

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.status = 0
    respond_to do |format|
      if @delivery.save  
        format.html { redirect_to customer_deliveries_path, notice: t('flash.actions.create.notice(a)', model: @delivery.model_name.human) }
        format.json { render :show, status: :created, location: @delivery }
        format.js {}
        current_order.fechado!
        session[:order_id] = nil
      else
        format.html { render :error }
        format.json { render json: @delivery.errors, status: :unprocessable_entity }
        format.js {}
      end
    end 
  end

  private

    def delivery_params
      params.permit(:id, :order_id, :details, :status)
    end

    def set_order
      @order = current_customer.orders.last
    end
end