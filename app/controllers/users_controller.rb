class UsersController < ApplicationController
  def edit
  end

  def update
    user = User.find(params[:id])
    binding.pry
    user.update(user_params)
    redirect_to controller: :messages, action: :index
  end

  private
  def user_params
    params.permit(:name, :email).merge(id: current_user.id)
  end
end
