class MembersController < ApplicationController
  def index
  end

  def search
    if params.key? :id
      members = Member.active.where id: params[:id]
    elsif ( params[:first_name].present? ||
        params[:last_name].present? ||
        params[:pesel].present?)
      members = Member.active
        .where("first_name LIKE ?", "%#{params[:first_name]}%")
        .where("last_name LIKE ?", "%#{params[:last_name]}%")
        .where("pesel LIKE ?", "%#{params[:pesel]}%")
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
    @member = Member.find params[:id]
  end

  def activity
    activities = []
    member = Member.select(:id).find params[:member_id]

    if params[:groups] == "true"
      activities += groups_activity member
    end

    if params[:events] == "true"
      activities += events_activity member
    end

    if params[:giving_lessons] == "true"
      activities += giving_lessons_activity member
    end

    if params[:taking_lessons] == "true"
      activities += taking_lessons_activity member
    end

    render json: activities
  end

  def edit
    @member = Member.find_or_create_by id: params[:id]
  end

  def update
    @member = Member.find params[:id]

    if @member.update member_params
      respond_to do |f|
        f.html { redirect_to @member }
        f.json { render json: {success: true} }
      end
    else
      respond_to do |f|
        f.html { render 'edit' }
        f.json { render json: {success: false} }
      end
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
    @member = Member.find params[:member_id]
    @member.active = true
    @member.save

    redirect_to @member
  end

private
  def member_params
    params.require(:member).permit :first_name, :last_name, :id_card, :pesel,
      :birth_date, :street, :house_number, :city, :school_id, :work, :email,
      :phone, :fathers_phone, :mothers_phone, :is_parents_agreement, :note
  end

  def groups_activity member
    activities = []

    since = params[:since]
    finish = params[:finish]

    tmp = member.group_presences
      .includes(:group)
      .select(:group_id, :datetime)
      .where(:datetime => since..finish)

    tmp.each do |i|
      url = url_for controller: "group_presences",
        action: "show",
        list_id: i.datetime.to_i,
        group_id: i.group.id,
        format: ""

      activities.push ({
        name: i.group.name,
        datetime: i.datetime,
        time: i.group.time,
        url: url
      })
    end

    activities
  end

  def events_activity member
    activities = []

    since = params[:since]
    finish = params[:finish]

    tmp = member.event_presences
      .includes(:event)
      .select(:event_id, :time)
      .where("events.datetime" => since..finish)

    tmp.each do |i|
      url = url_for controller: "events",
        action: "show",
        id: i.event.id,
        format: ""

      activities.push ({
        name: i.event.name,
        datetime: i.event.datetime,
        time: i.time,
        url: url
      })
    end

    activities
  end

  def giving_lessons_activity member
    activities = []

    since = params[:since]
    finish = params[:finish]

    tmp = member.giving_lessons
      .select(:id, :datetime, :time)
      .where(:datetime => since..finish)

    tmp.each do |i|
      url = url_for controller: "lessons",
        action: "show",
        id: i.id,
        format: ""

      activities.push ({
        name: I18n.t(:giving_lessons),
        datetime: i.datetime,
        time: i.time,
        url: url
      })
    end

    activities
  end

  def taking_lessons_activity member
    activities = []

    since = params[:since]
    finish = params[:finish]

    tmp = member.taking_lessons
      .select(:id, :datetime, :time)
      .where(:datetime => since..finish)

    tmp.each do |i|
      url = url_for controller: "lessons",
        action: "show",
        id: i.id,
        format: ""

      activities.push ({
        name: I18n.t(:taking_lessons),
        datetime: i.datetime,
        time: i.time,
        url: url
      })
    end

    activities
  end
end
