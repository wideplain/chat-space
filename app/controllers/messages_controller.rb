class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
  end

  def create
    @message = Message.create(message_params)
  end


  private

  def message_params

  end
end
