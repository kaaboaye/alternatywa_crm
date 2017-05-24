class MembersController < ApplicationController
  def index
    @members = Member.active
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new school_params

    if @member.save
      redirect_to @member
    else
      render 'new'
    end
  end

  def show
    @member = Member.find_by_id params[:id]
    if @member.nil?
      render 'index'
    end
  end

  def edit
    @member = Member.find_or_create_by id: params[:id]
  end

  def update
    @member = Member.find params[:id]

    if @member.update school_params
      redirect_to @member
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find params[:id]
    @member.active = false
    @member.save

    redirect_to schools_path
  end

  def disabled
    @member = Member.disabled
  end

  def restore
    @member = Member.find params[:id]
    @member.active = true
    @member.save

    redirect_to @member
  end

private
  def member_params
    params.require(:member).permit :first_name,
      :last_name, :pesel, :street, :house_number, :city, :school_id, :work,
      :phone, :fathers_phone, :mothers_phone
  end
end
