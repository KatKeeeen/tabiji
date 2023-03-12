class JournalsController < ApplicationController
  def index
    @journals = Journal.all
  end

  def new
    @journal = Journal.new
  end

  def create
    @journal = Journal.create(journal_params)
    if @journal.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def journal_params
    params.require(:journal).permit(:title, :comment, :departure_date, :last_date, :image).merge(user_id: current_user.id)
  end
end
