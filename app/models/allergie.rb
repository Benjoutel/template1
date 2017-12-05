class Allergie < ApplicationRecord
  belongs_to :patient
  validates :name, presence: true
end
