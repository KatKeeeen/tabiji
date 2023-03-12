class Journal < ApplicationRecord
  has_one_attached :image
  belongs_to  :user
  has_many :events

end
