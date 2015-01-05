class ProfilesController < ApplicationController
   def index
   @user = current_user
  end

  def edit
   @user = User.find(params[:id])
  end

 
  def update_profile
    @user = User.find(params[:id])
    if @user.update(profile_params)
      redirect_to profiles_path
    else
      render "edit"
    end
  end
  def change_password
    @user = current_user
    @user.errors.add(:password, "is required") if params[:user].nil? or params[:user][:password].to_s.blank?
    if @user.errors.empty? and @user.update_with_password(params[:user])
      sign_in(:user, @user, :bypass => true)
      respond_to do |format|
        format.js
      end
    end
  end

  private
  def profile_params
    params.require(:user).permit!
  end

end
