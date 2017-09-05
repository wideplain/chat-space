class GroupsController < ApplicationController
  def new
  end
  def create

  end
  def edit
  end
  def update
  end

  private

  def users_params
    params.require(:users).permit(
      colors: []
    )
  end
end
