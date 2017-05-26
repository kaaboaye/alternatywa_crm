class EventCategoriesController < ApplicationController
  def index
    @event_categories = EventCategory.active
  end

  def new
    @event_category = EventCategory.new
  end

  def create
    @event_category = EventCategory.new event_category_params

    if @event_category.save
      redirect_to @event_category
    else
      render 'new'
    end
  end

  def show
    @event_category = EventCategory.find_by_id params[:id]
    if @event_category.nil?
      render 'index'
    end
  end

  def edit
    @event_category = EventCategory.find_or_create_by id: params[:id]
  end

  def update
    @event_category = EventCategory.find params[:id]

    if @event_category.update event_category_params
      redirect_to @event_category
    else
      render 'edit'
    end
  end

  def destroy
    @event_category = EventCategory.find params[:id]
    @event_category.active = false
    @event_category.save

    redirect_to event_categories_path
  end

  def disabled
    @event_categories = EventCategory.disabled
  end

  def restore
    @event_category = EventCategory.find params[:id]
    @event_category.active = true
    @event_category.save

    redirect_to @event_category
  end

private
  def event_category_params
    params.require(:event_category).permit :name
  end
end
