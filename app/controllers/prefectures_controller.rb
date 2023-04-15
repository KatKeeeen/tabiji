class PrefecturesController < ApplicationController

  before_action :move_to_sign_in

  def index
    @journals = Journal.where(user_id: current_user.id)
    unless @journals.present?
      redirect_to root_path
    end
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    journal_ids = @prefecture.journal_prefectures.pluck(:journal_id)
    @journals = Journal.where(user_id: current_user.id).find([journal_ids])
  end

  private

  def move_to_sign_in
    unless user_signed_in?
      redirect_to new_user_session_path
    end
  end

end
