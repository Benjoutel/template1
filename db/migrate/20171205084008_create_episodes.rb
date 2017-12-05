class CreateEpisodes < ActiveRecord::Migration[5.0]
  def change
    create_table :episodes do |t|
      t.string :name
      t.string :description
      t.references :patient, foreign_key: true
    end
  end
end
