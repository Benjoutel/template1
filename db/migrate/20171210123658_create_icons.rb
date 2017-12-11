class CreateIcons < ActiveRecord::Migration[5.0]
  def change
    create_table :icons do |t|
      t.string :name
      t.string :photo
      t.timestamps
    end
  end
end
