class Admin::DeliveriesController < ApplicationController
  before_action :authenticate_user!
  before_action :set_delivery, only: [:edit, :update, :show]

  def index
    @deliveries = Delivery.all
  end

  def edit
  end

  def show
  end

  def update
  end

  private

    def set_delivery
      @delivery = Delivery.find(params[:id])
    end
end