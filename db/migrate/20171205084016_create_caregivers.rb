class CreateCaregivers < ActiveRecord::Migration[5.0]
  def change
    create_table :caregivers do |t|
      t.string :firstname
      t.string :lastname
      t.string :address
      t.string :mail
      t.string :phone_number
      t.string :speciality
      t.references :patient, foreign_key: true
    end
  end
end
