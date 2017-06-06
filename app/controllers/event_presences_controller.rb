class EventPresencesController < ApplicationController
  def index
    @event = Event.find_by_id(params[:event_id]) or not_found
  end

  def list
    event_presences = EventPresence.active
      .includes(:member)
      .select(:id, :time, :member_id)
      .where(event_id: params[:event_id])

    members = []
    event_presences.each do |event_presence|
      members.push({
          id: event_presence.id,
          time: event_presence.time,
          member: event_presence.member
        })
    end

    render json: members
  end

  def create
    count = EventPresence.active
      .where(event_id: params[:event_id])
      .where(member_id: params[:member_id])
      .count(:id)

    if count == 0
      event_presence = EventPresence.new event_presence_params

      if event_presence.save
        render json: {success: true}
      else
        render json: {
          success: false,
          errors: event_presence.errors.full_messages
          }
      end
    else
      render json: {
        success: false,
        errors: ["Duplikat"]
        }
    end
  end

  def destroy
    event_presence = EventPresence.find params[:id]
    event_presence.destroy
    render json: {success: true}
  end

private
  def event_presence_params
    params.permit :member_id, :event_id, :time
  end
end
