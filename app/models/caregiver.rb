class Caregiver < ApplicationRecord
  has_many :events
  belongs_to :patient
  validates :lastname, presence: true
  validates :speciality, presence: true
  mount_uploader :photo, PhotoUploader
end
