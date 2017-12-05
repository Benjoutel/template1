class CreateDocuments < ActiveRecord::Migration[5.0]
  def change
    create_table :documents do |t|
      t.string :category
      t.string :document
      t.string :name
      t.references :event, foreign_key: true
    end
  end
end
