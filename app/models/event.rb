class Event < ApplicationRecord
  has_many :documents, dependent: :destroy
  belongs_to :episode
  belongs_to :caregiver, optional: true
  mount_uploader :icon, PhotoUploader


  include PgSearch

  pg_search_scope :search,
    against: [ :description],
    associated_against: {
      documents: [ :name, :category ],
      caregiver: [:firstname, :lastname, :speciality]
    }

end

