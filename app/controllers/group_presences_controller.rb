class GroupPresencesController < ApplicationController
  def index
  end

  def new
    @group = Group.find_by_id(params[:group_id]) or not_found
  end

  def create
    @grop_presence = School.new school_params

    if @grop_presence.save
      redirect_to @grop_presence
    else
      render 'new'
    end
  end

  def show
  end

  def edit
  end

  def disabled
  end
end
