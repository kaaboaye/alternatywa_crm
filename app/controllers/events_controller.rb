class EventsController < ApplicationController
  def index
  end

  def search
    if params[:id].present?
      events = Event.active.where id: params[:id]
    elsif params[:name].present? && params[:event_category_id].present?
      events = Event.active
                .where("name LIKE ?", "%#{params[:name]}%")
                .where(event_category_id: params[:event_category_id])
    elsif params[:name].present?
      events = Event.active
                .where("name LIKE ?", "%#{params[:name]}%")
    elsif params[:event_category_id].present?
      events = Event.active
                .where(event_category_id: params[:event_category_id])
    else
      events = Event.active
    end

    json_enevts = []
    events.each do |event|
      json_enevts.push(
        id: event.id,
        name: event.name,
        category: event.event_category.name
      )
    end

    render json: json_enevts
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new event_params

    if @event.save
      redirect_to @event
    else
      render 'new'
    end
  end

  def show
    @event = Event.find_by_id params[:id]
    if @event.nil?
      render 'index'
    end
  end

  def edit
    @event = Event.find_or_create_by id: params[:id]
  end

  def update
    @event = Event.find params[:id]

    if @event.update event_params
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = Event.find params[:id]
    @event.active = false
    @event.save

    redirect_to events_path
  end

  def disabled
    @events = Event.disabled
  end

  def restore
    @event = Event.find params[:id]
    @event.active = true
    @event.save

    redirect_to @event
  end

private
  def event_params
    params.require(:event).permit :name, :description, :event_category_id,
      :datetime
  end
end
