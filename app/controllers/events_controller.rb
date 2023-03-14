class EventsController < ApplicationController

  def index
    @journal = Journal.find(params[:journal_id])
    @events = @journal.events
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.create(event_params)
    if @event.save
      redirect_to journal_events_path
    else
      render :new
    end
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :place, :comment, :image).merge(journal_id: params[:journal_id])
  end

end
