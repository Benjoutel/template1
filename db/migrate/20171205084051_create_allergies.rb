class CreateAllergies < ActiveRecord::Migration[5.0]
  def change
    create_table :allergies do |t|
      t.string :name
      t.references :patient, foreign_key: true
    end
  end
end
