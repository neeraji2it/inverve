class Admin::ProfilesController < ApplicationController
  before_filter :authenticate_admin!
  def index
    
  end
  
  def setting
    
  end
  
  def update_setting
    if current_admin.update_attributes(admin_params)
      flash[:notice] = "Your profile has been successfully updated."
      redirect_to admin_profiles_path
    else
      render :action => :setting
    end
  end

  def edit_passcode
    
  end

  def update_passcode
    if current_admin.update_attributes(admin_params)
      sign_in(:admin, current_admin, :bypass => true)
      flash[:notice] = "Your password has been successfully updated."
      redirect_to admin_profiles_path
    else
      render :action => :edit_passcode
    end
  end

  private
  def admin_params
    params.require(:admin).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end  
end