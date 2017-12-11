class Caregiver < ApplicationRecord
  has_many :events
  has_many :episodes, through: :events

  belongs_to :patient
  validates :lastname, presence: true
  validates :speciality, presence: true
  mount_uploader :photo, PhotoUploader

  scope :for_episode, ->(episode_id) { joins(:episodes).where("episodes.id = ?", episode_id).distinct }
end
