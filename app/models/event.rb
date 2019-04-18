class Event < ApplicationRecord
  validates :start, presence: true

  has_many :venue_suggestions, -> { active }, inverse_of: :event
end
