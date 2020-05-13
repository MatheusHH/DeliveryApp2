class ApplicationController < ActionController::Base

  layout :layout_by_resource

  rescue_from ActiveRecord::DeleteRestrictionError, with: :impossible_to_delete
  
  private
  
  def layout_by_resource
    if devise_controller?
      "devise_layout"
    else
      "application"
    end
  end

  def after_sign_in_path_for(resource)
    if resource_name == :user 
      admin_root_path
    end
  end

  def after_sign_out_path_for(resource_or_scope) 
    if resource_or_scope == :user 
      new_user_session_path
    #elsif resource_or_scope == :company_user
    #  new_company_user_session_path
    end
  end
end
