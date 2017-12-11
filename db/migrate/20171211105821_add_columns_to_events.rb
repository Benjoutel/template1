class AddColumnsToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :icon, :string
  end
end
