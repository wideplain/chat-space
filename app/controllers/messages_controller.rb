class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
    @message = Message.new
  end

  def new

  end

  def create
    message = Message.new(message_params)
    if message.save
      redirect_to group_messages_path
    end
  end


  private

  def message_params
    params.require(:message).permit(:body, :user_id, :image).merge(group_id: params[:group_id])
  end
end
