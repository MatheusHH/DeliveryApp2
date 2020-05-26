class Customer::DeliveriesController < CustomersController
  before_action :authenticate_customer!

  def create
    @delivery = Delivery.new(delivery_params)
    @delivery.status = 0
    respond_to do |format|
      if @delivery.save  
        format.html { redirect_to customer_order_path(@delivery.order.id), notice: t('flash.actions.create.notice', model: @delivery.model_name.human) }
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
      params.permit(:order_id, :details, :status)
    end
end