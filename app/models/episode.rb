class Episode < ApplicationRecord
  belongs_to :patient
  has_many :events, dependent: :destroy
  validates :name, presence: true
end
