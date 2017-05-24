class GroupsController < ApplicationController
  def index
    @groups = Group.active
  end

  def new
    @group = Group.new
  end

  def create
    @group = Group.new group_params

    if @group.save
      redirect_to @group
    else
      render 'new'
    end
  end

  def show
    @group = Group.find_by_id params[:id]

    if @group.nil?
      render 'index'
    end
  end

  def edit
    @group = Group.find_or_create_by id: params[:id]
  end

  def update
    @group = Group.find params[:id]

    if @group.update group_params
      redirect_to @group
    else
      render 'edit'
    end
  end

  def destroy
    @group = Group.find params[:id]
    @group.active = false
    @group.save

    redirect_to groups_path
  end

  def disabled
    @members = Member.disabled
  end

  def restore
    @group = Group.find params[:id]
    @group.active = true
    @group.save

    redirect_to @group
  end

private
  def group_params
    params.require(:group).permit :name, :description
  end
end