class EventsController < ApplicationController

  before_action :move_to_sign_in
  before_action :journal_setting, only: [:index, :new, :create, :edit, :update]
  before_action :event_setting, only: [:edit, :update, :destroy]

  def index
    @events = @journal.events.sort {|a, b| a[:time] <=> b[:time]}
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
  end

  def update
    @event.update(event_params)
    if @event.save
      redirect_to journal_events_path
    else

      render :edit
    end
  end

  def destroy
    @event.destroy
    redirect_to journal_events_path
  end


  private

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def journal_setting
    @journal = Journal.find(params[:journal_id])
  end

  def event_setting
    @event = Event.find(params[:id])
  end

  def event_params
    params.require(:event).permit(:date, :time, :place, :comment, :image).merge(journal_id: params[:journal_id])
  end

end
