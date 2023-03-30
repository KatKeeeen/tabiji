class JournalsController < ApplicationController
  def index
    @journals = Journal.all.order('created_at DESC')
  end

  def new
    @journal_journal_prefecture = JournalJournalPrefecture.new
  end

  def create
    @journal_journal_prefecture = JournalJournalPrefecture.new(journal_params)
    if @journal_journal_prefecture.valid?
      @journal_journal_prefecture.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def journal_params
    params.require(:journal_journal_prefecture).permit(:title, :comment, :departure_date, :last_date, :image, {prefecture_ids: []}).merge(user_id: current_user.id)
  end
end
