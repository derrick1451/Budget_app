class GroupsController < ApplicationController
  # load resources
  before_action :authenticate_user!
  load_and_authorize_resource
  def index
    @groups = current_user.groups.order(created_at: :desc)
  end

  def new
    @group = Group.new
  end

  def create
    @group = current_user.groups.new(group_params)
    if @group.save
      redirect_to groups_path
    else
      render :new
    end
  end

  private

  def group_params
    params.require(:group).permit(:name, :icon)
  end
end
