class Vaccination < ApplicationRecord
  belongs_to :patient
  validates :vaccin, presence: true
end
