class JournalPrefecture < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to  :journal
  belongs_to  :prefecture
end
