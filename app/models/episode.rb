class Episode < ApplicationRecord
  belongs_to :patient
  has_many :events, dependent: :destroy
  validates :name, presence: true
  mount_uploader :icon, PhotoUploader

  # pg_search_scope :global_search,
  #  # against: [ :title, :syllabus ],
  #  associated_against: {
  #    events: [ :description, :last_name ]
  #  }

end
