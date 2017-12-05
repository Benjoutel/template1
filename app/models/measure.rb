class Measure < ApplicationRecord
  belongs_to :patient
  validates :name, presence: true
  validates :value, presence: true
end
