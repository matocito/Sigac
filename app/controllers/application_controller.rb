class ApplicationController < ActionController::Base
  protect_from_forgery
  
  layout :layout_by_resource

  protected

  def layout_by_resource
    if devise_controller?
      "login"
    else
      resource_name.to_s
    end
  end
end
