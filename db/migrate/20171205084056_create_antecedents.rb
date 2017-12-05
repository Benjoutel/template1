class CreateAntecedents < ActiveRecord::Migration[5.0]
  def change
    create_table :antecedents do |t|
      t.string :description
      t.references :patient, foreign_key: true
    end
  end
end
