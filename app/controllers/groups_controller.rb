class GroupsController < ApplicationController
  def new
    @users = User.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    # binding.pry
    @group.save
    # redirect_to group_messages_path, action: :get
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
