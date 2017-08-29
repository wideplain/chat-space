class UsersController < ApplicationController
  def edit
  end

  def update
    current_user.update(user_params)
    if current_user.update_attributes(user_params)
      redirect_to root_path
    else
      redirect_to edit_user_path
    end
  end

  private
  def user_params
    params.require(:user).permit(:name, :email)
  end
end
