class GroupsController < ApplicationController
  def new
    @users = User.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    @group.save
    redirect_to root_path
  end

  def edit
  end

  def update
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
