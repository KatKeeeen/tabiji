class JournalsController < ApplicationController

  before_action :move_to_sign_in

  def index
    @journals = Journal.where(user_id: current_user.id).order(departure_date: :desc)
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

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

  def journal_params
    params.require(:save_journal_prefecture).permit(:title, :comment, :departure_date, :last_date, :image, {prefecture_ids: []}).merge(user_id: current_user.id)
  end
end
