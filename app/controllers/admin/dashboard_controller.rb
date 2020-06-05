class Admin::DashboardController < ApplicationController
  before_action :authenticate_user!
  
  def index
    @pending_deliveries = Delivery.where(status: :pendente).count
  end
end
