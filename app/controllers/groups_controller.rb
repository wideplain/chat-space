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
    if @group.user_ids.any?
      if @group.save
        redirect_to root_path, notice: 'グループが更新されました'
      else
        flash[:alert] = 'グループが作成されませんでした'
        render :new
      end
    else
      flash[:alert] = 'ユーザーが選択されていません'
      render :new
    end
  end

  def edit
    @group = Group.find(params[:id])
  end

  def update
    @group = Group.find(params[:id])
     if group_params[:user_ids].last.present?
      if @group.update(group_params)
        redirect_to root_path, notice: 'グループが更新されました'
      else
        flash[:alert] = 'グループが作成されませんでした'
        render :edit
      end
    else
      flash[:alert] = 'ユーザーが選択されていません'
      render :edit
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, user_ids:[])
  end
end
