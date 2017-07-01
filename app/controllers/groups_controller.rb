class GroupsController < ApplicationController
  def index
  end

  def search
    if params[:id].present?
      groups = Group.active.where id: params[:id]
    elsif params[:name].present?
      groups = Group.active.where "name LIKE ?", "%#{params[:name]}%"
    else
      groups = Group.active
    end

    render json: groups
  end

  def search_lists
    if params[:since].present? && params[:finish].present?
      since = Time.at(params[:since].to_f)
      finish = Time.at(params[:finish].to_f)

      group_lists = GroupPresence.active
        .select(:datetime)
        .where(group_id: params[:group_id])
        .where(:datetime => since..finish)
        .group(:datetime)
        .order(datetime: :desc)
        .count(:member_id)
    else
      group_lists = []
    end

    render json: group_lists.map { |key, value| {"datetime": key, "count": value} }
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
    @group = Group.find params[:id]
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
    @groups = Group.disabled
  end

  def restore
    @group = Group.find params[:id]
    @group.active = true
    @group.save

    redirect_to @group
  end

private
  def group_params
    params.require(:group).permit :name, :description, :time
  end
end
