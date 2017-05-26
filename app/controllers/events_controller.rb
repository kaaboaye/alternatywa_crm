class EventsController < ApplicationController
  def index
    @events = Event.active
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
    params.require(:event).permit :name, :description, :event_category_id
  end
end
