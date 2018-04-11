class EventsController < ApplicationController
  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to :events
    else
      render 'new'
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    redirect_to :occurances
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:event).permit(:name, :category)
  end

end
