class AddPhotoToCaregivers < ActiveRecord::Migration[5.0]
  def change
    add_column :caregivers, :photo, :string
  end
end
