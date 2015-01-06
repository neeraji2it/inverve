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
    
    if @user.errors.empty? and @user.update(profile_params)
      flash[:notice] = "Your password is successfully updated."
      sign_in(:user, @user, :bypass => true)
      redirect_to edit_profile_path(current_user.id)
    else
      render :action => :edit
    end
  end

private
def profile_params
  params.require(:user).permit!
end

end