class ApplicationController < ActionController::Base
# Prevent CSRF attacks by raising an exception.
# For APIs, you may want to use :null_session instead.
helper :all
protect_from_forgery with: :exception
helper_method :current_cart
layout :get_layout
before_filter :update_sanitized_params, if: :devise_controller?
before_filter :load_news_letter

def update_sanitized_params
  devise_parameter_sanitizer.for(:sign_up) {|u| u.permit!}
end

def after_sign_in_path_for(resource_or_scope)
  if resource_or_scope.is_a?(Admin)
    admin_dashboards_path
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

def load_news_letter
  @news_letter ||= NewsLetter.new
end

def offer_collections
  @offer_go = OfferCollection.first_or_initialize
  #  @offer_first = CollectionFirst.first_or_initialize
  # @offer_second = CollectionSecond.first_or_initialize
  # @offer_third = CollectionThird.first_or_initialize
  # @offer_fourth = CollectionFourth.first_or_initialize
  # @offer_fifth = CollectionFifth.first_or_initialize
  # @offer_sixth = CollectionSixth.first_or_initialize
  # @offer_seventh = CollectionSeventh.first_or_initialize
  # @offer_eighth = CollectionEighth.first_or_initialize
end 

protected
def get_layout
  if devise_controller? && (resource_name == :admin || resource_name == :user)
    "login"
  elsif self.class.parent == Admin
    "admin"
  else
    "application"
  end
end
end