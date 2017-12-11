class Episode < ApplicationRecord
  belongs_to :patient
  has_many :association_icons
  has_many :events, dependent: :destroy
  validates :name, presence: true
end
