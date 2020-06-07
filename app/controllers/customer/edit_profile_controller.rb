class Customer::EditProfileController < CustomersController
  before_action :authenticate_customer!
  before_action :set_customer

  def edit
    @customer.build_profile unless @customer.profile.present?
  end

  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to customer_root_url, notice: t('flash.actions.update.notice', model: @customer.model_name.human) }
        bypass_sign_in @customer, scope: :customer
      else
        format.html { render :edit }
      end
    end
  end

  private
    
    def set_customer
      @customer = Customer.find(params[:id])
    end

    def customer_params
      passwd = params[:customer][:password]
      passwd_confirmation = params[:customer][:password_confirmation]

      if passwd.blank? && passwd_confirmation.blank?
        params[:customer].delete(:password)
        params[:customer].delete(:password_confirmation)
      end
      
      params.require(:customer).permit(:email, :password, :password_confirmation, profile_attributes: [:id, :name, :cellphone, :cpf, :cep, :neighborhood, :street, :city, :state, :number, :_destroy])
    end
end