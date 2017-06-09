class MembersController < ApplicationController
  def index
  end

  def search
    if params.key? :id
      members = Member.active.where id: params[:id]
    elsif ( params[:first_name].present? ||
        params[:last_name].present? ||
        params[:pesel].present? ||
        params[:city].present? ||
        params[:phone].present?)
      members = Member.active
        .where("first_name LIKE ?", "%#{params[:first_name]}%")
        .where("last_name LIKE ?", "%#{params[:last_name]}%")
        .where("pesel LIKE ?", "%#{params[:pesel]}%")
        .where("city LIKE ?", "%#{params[:city]}%")
        .where("phone LIKE ?", "%#{params[:phone]}%")
        .limit(25)
    else
      members = []
    end

    render json: members
  end

  def new
    @member = Member.new
  end

  def create
    @member = Member.new member_params

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

    if @member.update member_params
      redirect_to @member
    else
      render 'edit'
    end
  end

  def destroy
    @member = Member.find params[:id]
    @member.active = false
    @member.save

    redirect_to members_path
  end

  def disabled
    @members = Member.disabled
  end

  def restore
    @member = Member.find params[:id]
    @member.active = true
    @member.save

    redirect_to @member
  end

private
  def member_params
    params.require(:member).permit :first_name, :last_name, :pesel, :street,
      :house_number, :city, :school_id, :work, :email, :phone, :fathers_phone,
      :mothers_phone
  end
end
