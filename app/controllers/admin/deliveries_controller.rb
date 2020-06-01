class Admin::DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery, only: [:edit, :update, :show]

  def index
    @deliveries = Delivery.order(:status).page(params[:page]).per(5)
  end

  def edit
  end

  def show
  end

  def update
    respond_to do |format|
      if @delivery.update(delivery_params)
        format.html { redirect_to admin_deliveries_url, notice: t('flash.actions.update.notice(a)', model: @delivery.model_name.human) }
      else
        format.html { render :edit }
      end
    end
  end

  private

    def set_delivery
      @delivery = Delivery.find(params[:id])
    end

    def delivery_params
      params.require(:delivery).permit(:status)
    end
end