class JournalsController < ApplicationController
  def index
    @journals = Journal.all.order('created_at DESC')
  end

  def new
    @journal_prefecture = SaveJournalPrefecture.new
  end

  def create
    @journal_prefecture = SaveJournalPrefecture.new(journal_params)
    if @journal_prefecture.valid?
      @journal_prefecture.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def journal_params
    params.require(:save_journal_prefecture).permit(:title, :comment, :departure_date, :last_date, :image, {prefecture_ids: []}).merge(user_id: current_user.id)
  end
end
