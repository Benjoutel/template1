class DropAssociationIcons < ActiveRecord::Migration[5.0]
  def change
    drop_table :association_icons
    drop_table :icons
  end
end
