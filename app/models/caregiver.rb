class Caregiver < ApplicationRecord
  has_many :evenements
  belongs_to :patient
  validates :firstname, presence: true
  validates :lastname, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :speciality, presence: true
end
