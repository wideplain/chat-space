class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
  end
end
