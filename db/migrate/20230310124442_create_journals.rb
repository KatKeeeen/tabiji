class CreateJournals < ActiveRecord::Migration[6.1]
  def change
    create_table :journals do |t|
      t.string :title,           null: false
      t.text   :comment,         null: false
      t.date   :departure_date,  null: false
      t.date   :last_date,       null: false
      t.references :user,        null: false, foreign_key: true
      t.timestamps
    end
  end
end
