class MessagesController < ApplicationController
  before_action :index_method
  def index
  end

  def new
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

  def index_method
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
    @message = Message.new
  end
end
