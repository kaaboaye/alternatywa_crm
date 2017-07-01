class GroupPresencesController < ApplicationController
  def index
  end

  def search
    if params[:datetime].present?
      grop_presences = GroupPresence.active
        .includes(:member)
        .select(:id, :member_id)
        .where(group_id: params[:group_id])
        .where(datetime: Time.at(params[:datetime].to_f))
    else
      grop_presences = []
    end

    members = []
    grop_presences.each do |i|
      members.push({
          id: i.id,
          member_id: i.member.id,
          first_name: i.member.first_name,
          last_name: i.member.last_name,
          pesel: i.member.pesel
        })
    end

    render json: members
  end

  def new
    @group = Group.find_by_id(params[:group_id]) or not_found
  end

  def create
    count = GroupPresence.where(member_id: params[:member_id])
      .where(group_id: params[:group_id])
      .where(datetime: Time.at(params[:datetime].to_f))
      .count(:id)

    @grop_presence = GroupPresence.new group_presence_params
    @grop_presence.datetime = Time.at params[:datetime].to_f

    if @grop_presence.save && count == 0
      render json: {success: true}
    else
      render json: {
        success: false,
        errors: @grop_presence.errors.full_messages
        }
    end
  end

  def destroy
    grop_presence = GroupPresence.find params[:id]
    grop_presence.destroy
    render json: {success: true}
  end

  def show
    @group = Group.find_by_id(params[:group_id]) or not_found

    list = GroupPresence.active
      .includes(:member)
      .select(:member_id)
      .where(group_id: params[:group_id])
      .where(datetime: Time.at(params[:list_id].to_f))

    @members = []
    list.each do |item|
      @members.push item.member
    end

    @date = Time.at params[:list_id].to_i
    @date.to_formatted_s :long
  end

private
  def group_presence_params
    params.permit :member_id, :group_id
  end
end
