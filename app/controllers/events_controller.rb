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

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    if @event.save
      redirect_to journal_events_path
    else
      render :edit
    end
  end

  def destroy
    event = Event.find(params[:id])
    event.destroy
    redirect_to journal_events_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :time, :place, :comment, :image).merge(journal_id: params[:journal_id])
  end

end
