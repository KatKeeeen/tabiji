class PrefecturesController < ApplicationController
  def index
    @prefectures = Prefecture.all
  end

  def show
    @prefecture = Prefecture.find(params[:id])
    journal_ids = @prefecture.journal_prefectures.pluck(:journal_id)
    @journals = Journal.find([journal_ids])
    
  end
end
