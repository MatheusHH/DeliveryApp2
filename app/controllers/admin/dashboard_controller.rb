class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  before_action :current_date
  
  def index
    @pending_deliveries = Delivery.where(status: :pendente).count
    @total_orders_month = Order.where(status: :fechado).where(created_at: current_date.beginning_of_month..current_date.end_of_month).sum(:subtotal_cents)
    @total_orders_year = Order.where(status: :fechado).where(created_at: current_date.beginning_of_year..current_date.end_of_year).sum(:subtotal_cents)
    @total_deliveries = Delivery.where(created_at: current_date.beginning_of_day..current_date.end_of_day).count
  end

  private

    def current_date
      date = Date.current
      date
    end
end
