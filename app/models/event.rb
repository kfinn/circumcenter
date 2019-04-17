class Event < ApplicationRecord
  validates :start, presence: true
end
