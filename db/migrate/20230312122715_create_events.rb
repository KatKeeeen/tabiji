class CreateEvents < ActiveRecord::Migration[6.1]
  def change
    create_table :events do |t|
      t.date :date,           null: false
      t.time :time,           null: false
      t.string :place        
      t.text :comment,        null: false
      t.references :journal,  null: false, foreign_key: true
      t.timestamps
    end
  end
end
