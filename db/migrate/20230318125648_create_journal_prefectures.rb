class CreateJournalPrefectures < ActiveRecord::Migration[6.1]
  def change
    create_table :journal_prefectures do |t|
      t.references :journal,    null: false, foreign_key: true
      t.integer :prefecture_id, null: false
      t.timestamps
    end
  end
end
