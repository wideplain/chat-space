class GroupsController < ApplicationController
  def index
    @groups = current_user.groups
  end

  def new
    @users = User.all
    @group = Group.new
  end

  def create
    @group = Group.new(group_params)
    if @group.save
      redirect_to root_path, notice: 'グループが作成されました'
    else
      flash[:alert] = 'グループが作成されませんでした'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
    if @group.update(group_params)
      redirect_to root_path, notice: 'グループ情報が更新されました'
    else
      flash[:alert] = 'グループが更新されませんでした'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
