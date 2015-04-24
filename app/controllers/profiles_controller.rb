class ProfilesController < ApplicationController
  before_action :load_current_user, only: [:index, :change_password]
  before_action :load_user, only: [:edit, :update_profile]

   def index
   end

   def edit
   end

   def update_profile
      if @user.update(profile_params)
        redirect_to profiles_path
      else
        render "edit"
      end
    end

    def change_password
      if @user.errors.empty? and @user.update(profile_params)
        flash[:notice] = "Your password is successfully updated."
        sign_in(:user, @user, :bypass => true)
        redirect_to edit_profile_path(current_user.id)
      else
        render :action => :edit
      end
    end

    private
    def load_current_user
      @user = current_user
    end

    def load_user
      @user = User.find(params[:id])
    end
      
    def profile_params
      params.require(:user).permit!
    end
end