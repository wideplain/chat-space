class MessagesController < ApplicationController
  before_action :set_message, only: [:index, :create]
  before_action :set_group, only: [:index, :create]
  def index
  end

  def create
    @message = current_user.messages.new(message_params)
    if @message.save
      redirect_to group_messages_path
    else
      render :index
      flash[:alert] = 'メッセージを入力してください'
    end
  end


  private

  def message_params
    params.require(:message).permit(:body, :user_id, :image).merge(group_id: params[:group_id])
  end

  def set_message
    @message = Message.new
  end

  def set_group
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
  end
end
