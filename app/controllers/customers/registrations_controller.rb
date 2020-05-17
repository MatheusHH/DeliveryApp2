class Customers::RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters

  def new
    # Override Devise default behaviour and create a profile as well
    build_resource({})
    resource.build_profile
    respond_with self.resource
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up) do |customer|
      customer.permit(:email, :password, :password_confirmation, profile_attributes: [:id, :cep, :neighborhood, :street, :city, :state, :cellphone, :name, :_destroy])
    end
  end
end
