class SchoolsController < ApplicationController
  def index
  end

  def search
    if params.key? :id
      @schools = School.where id: params[:id]
    elsif params[:name].blank?
      @schools = []
    elsif params.key? :name
      @schools = School.where "name LIKE ?", "%#{params[:name]}%"
    else
      @schools = []
    end

    render json: @schools
  end

  def new
    @school = School.new
  end

  def create
    @school = School.new school_params

    if @school.save
      redirect_to @school
    else
      render 'new'
    end
  end

  def show
    @school = School.find_by_id params[:id]
    if @school.nil?
      render 'index'
    end
  end

  def edit
    @school = School.find_or_create_by id: params[:id]
  end

  def update
    @school = School.find params[:id]

    if @school.update school_params
      redirect_to @school
    else
      render 'edit'
    end
  end

  def destroy
    @school = School.find params[:id]
    @school.active = false
    @school.save

    redirect_to schools_path
  end

  def disabled
    @schools = School.disabled
  end

  def restore
    @school = School.find params[:id]
    @school.active = true
    @school.save

    redirect_to @school
  end

private
  def school_params
    params.require(:school).permit :name
  end
end
