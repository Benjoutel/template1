class Document < ApplicationRecord
  belongs_to :event
  validates :name, presence: true
  validates :category, presence: true
end
