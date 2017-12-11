class CreateAssociationIcons < ActiveRecord::Migration[5.0]
  def change
    create_table :association_icons do |t|
      t.references :icon, foreign_key: true
      t.references :caregiver, foreign_key: true
      t.references :event, foreign_key: true
      t.references :episode, foreign_key: true
    end
  end
end
