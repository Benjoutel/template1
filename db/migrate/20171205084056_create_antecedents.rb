class CreateAntecedents < ActiveRecord::Migration[5.0]
  def change
    create_table :antecedents do |t|
      t.text :description
      t.references :patient, foreign_key: true
      t.timestamps
    end
  end
end
