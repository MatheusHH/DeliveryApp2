class ApplicationController < ActionController::Base

  layout :layout_by_resource

  rescue_from ActiveRecord::DeleteRestrictionError, with: :impossible_to_delete

  before_action :store_customer_location!, if: :storable_location?
  
  private
  
  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

  def storable_location?
    request.get? && is_navigational_format? && !devise_controller? && !request.xhr? 
  end

  def store_customer_location!
    store_location_for(:customer, request.fullpath)
  end
  


  def after_sign_in_path_for(resource)
    if resource_name == :user 
      admin_root_path
    elsif resource_name == :customer
      stored_location = stored_location_for(resource) 
      if stored_location.match(site_carts_path)
        site_carts_path
      else
        customer_root_path
      end
    end
  end

  def after_sign_out_path_for(resource_or_scope) 
    if resource_or_scope == :user 
      new_user_session_path
    elsif resource_or_scope == :customer
      root_path
    end
  end

  def impossible_to_delete
    flash[:alert] = t("flash.impossible_to_delete")
    redirect_to(request.referrer || root_path)
  end
end
