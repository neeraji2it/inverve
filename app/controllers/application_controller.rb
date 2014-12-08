class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  helper :all
  protect_from_forgery with: :exception
  helper_method :current_cart

  before_filter :update_sanitized_params, if: :devise_controller?

    def update_sanitized_params
      devise_parameter_sanitizer.for(:sign_up) {|u| u.permit!}
    end
  
  
  def after_sign_in_path_for(resource_or_scope)
    if resource_or_scope.is_a?(Admin)
     admin_products_path
     
      else resource_or_scope.is_a?(User)
    homes_path
      end
  end

  def sign_in?
    unless current_user or current_admin
      redirect_to new_user_session_path
    end
  end

  
def current_cart
    if session[:cart_id]
      @current_cart ||= Cart.find(session[:cart_id])
      session[:cart_id] = nil if @current_cart.purchased_at
    else
     session[:cart_id].nil?
      @current_cart = Cart.create!
      session[:cart_id] = @current_cart.id
    end
    @current_cart
  end

end
