class EventsController < ApplicationController
  def index
    @journal = Journal.find(params[:journal_id])
  end
end
