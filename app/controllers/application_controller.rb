class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:account_update) { |u| 
      u.permit(:firstname, :lastname, :password, :password_confirmation, :current_password) 
    }
    devise_parameter_sanitizer.for(:sign_up) { |u| 
      u.permit(:firstname, :lastname, :password, :password_confirmation, :email) 
    }
  end
  
  def current_order
    if cookies[:current_order]  
      if Order.where(id: cookies[:current_order]).any?
        Order.find(cookies[:current_order])
      end
    end
  end
end
