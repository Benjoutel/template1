class CreateEvents < ActiveRecord::Migration[5.0]
  def change
    create_table :events do |t|
      t.string :name
      t.date :date
      t.text :description
      t.string :category
      t.references :episode, foreign_key: true
      t.references :caregiver, foreign_key: true
      t.timestamps
    end
  end
end
