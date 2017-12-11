class AddColumnsToEpisodes < ActiveRecord::Migration[5.0]
  def change
    add_column :episodes, :icon, :string
  end
end
