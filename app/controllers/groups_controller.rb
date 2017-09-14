class GroupsController < ApplicationController
  def new
    @users = User.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path
      flash[:notice] = "グループが作成されました"
    else
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path
      flash[:notice] = "グループ情報が更新されました"
    else
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
