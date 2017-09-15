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
      user_ids_validates
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
      user_ids_validates
    else
      flash[:alert] = 'グループが更新されませんでした'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end

  def user_ids_validates
    if @group.user_ids.any?
        redirect_to root_path, notice: 'グループが更新されました'
    else
      flash[:alert] = 'ユーザーが選択されていません'
      render :new
    end
  end
end
