class MessagesController < ApplicationController
  def index
    @groups = current_user.groups
    @group = Group.includes(:users, :messages).find(params[:group_id])
    @message = Message.new
  end

  def new

  end

  def create
    @message = Message.create(message_params)
    redirect_to group_messages_path #render :indexだとNoMethodErrorエラーが出る
  end


  private

  def message_params
    params.require(:message).permit(:body, :user_id).merge(group_id: params[:group_id])
  end
end
