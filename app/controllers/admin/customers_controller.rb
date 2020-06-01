class Admin::CustomersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_customer, only: [:show]

  def index
    @customers = Customer.all.page(params[:page]).per(5)
  end

  def show
  end

  private

    def set_customer
      @customer = Customer.find(params[:id])
    end
end