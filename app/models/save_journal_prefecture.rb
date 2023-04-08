
class SaveJournalPrefecture
  include ActiveModel::Model
  include ActiveRecord::AttributeAssignment
  attr_accessor :image, :title, :comment, :departure_date, :last_date, :user_id, :prefecture_ids

  with_options presence: true do
    validates :image
    validates :title
    validates :departure_date
    validates :last_date
  end

  
  validate :date_check

  def save
    journal = Journal.create(image: image, title: title, comment: comment, departure_date: departure_date, last_date: last_date, user_id: user_id)
    unless prefecture_ids.nil?
      prefecture_ids.each do |prefecture_id|
        JournalPrefecture.create(journal_id: journal.id, prefecture_id: prefecture_id)
      end
    end
  end


 
  private
 
  def date_check
    errors.add(:last_date, "は出発日以降を入力してください") unless
    self.departure_date <= self.last_date
  end

end
