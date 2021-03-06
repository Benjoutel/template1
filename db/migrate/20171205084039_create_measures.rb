class CreateMeasures < ActiveRecord::Migration[5.0]
  def change
    create_table :measures do |t|
      t.string :name
      t.integer :value
      t.date :date
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
