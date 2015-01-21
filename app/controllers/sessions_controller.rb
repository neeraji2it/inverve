class SessionsController < Devise::SessionsController
  def create
    resource = warden.authenticate!(:scope => resource_name)
    flash[:notice] = "You are signed in successfully."
    if params[:param1] == "orders"
      redirect_to new_order_path
    else
      redirect_to homes_path
    end
  end
end