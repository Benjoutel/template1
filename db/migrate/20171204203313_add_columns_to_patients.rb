class AddColumnsToPatients < ActiveRecord::Migration[5.0]
  def change
    add_column :patients, :firstname, :string
    add_column :patients, :lastname, :string
    add_column :patients, :birth_date, :string
    add_column :patients, :address, :string
    add_column :patients, :phone_number, :string
    add_column :patients, :photo, :string
    add_column :patients, :mail, :string
    add_column :patients, :insee, :string
    add_column :patients, :nationality, :string
    add_column :patients, :civil_status, :string
    add_column :patients, :birth_place, :string
  end
end
