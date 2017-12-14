class CreateInvitations < ActiveRecord::Migration[5.0]
  def change
    create_table :invitations do |t|
      t.references :episode, foreign_key: true
      t.references :caregiver, foreign_key: true
      t.references :specialist, foreign_key: true
    end
  end
end
