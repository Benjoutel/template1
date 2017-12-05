class CreateVaccinations < ActiveRecord::Migration[5.0]
  def change
    create_table :vaccinations do |t|
      t.string :vaccin
      t.date :date
      t.string :recall
      t.references :patient, foreign_key: true
    end
  end
end
