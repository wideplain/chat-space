class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
    @message = Message.new
  end

  def new

  end

  def create
    if message_params[:body].present?
      @message = Message.create(message_params)
      redirect_to group_messages_path, notice: 'メッセージが投稿されました'
    else
      redirect_to group_messages_path, alert: 'メッセージを入力してください'
    end
  end


  private

  def message_params
    params.require(:message).permit(:body).merge(group_id: params[:group_id], user_id: current_user.id)
  end
end
