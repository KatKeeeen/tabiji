class Event < ApplicationRecord
  has_one_attached :image
  belongs_to  :journal

  with_options presence: true do
    validates :date
    validates :time
    validates :comment
  end

  validate :date_check

  private
 
  def date_check
    errors.add(:date, "は旅期間内で入力してください") unless
    self.date >= journal.departure_date && self.date <= journal.last_date
  end

end
