class UsersController < ApplicationController
  def edit
    @user = current_user
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to controller: :messages, action: :index
  end

  private
  def user_params
    params.require(:user).permit(:name, :email).merge(id: current_user.id)
  end
end
