class Journal < ApplicationRecord
  
  has_one_attached :image
  belongs_to  :user
  has_many :events
  
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_many :journal_prefectures
  has_many :prefectures, through: :journal_prefectures
end
