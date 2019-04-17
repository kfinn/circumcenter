class Recommendation < ApplicationRecord
  belongs_to :event
  belongs_to :venue

  accepts_nested_attributes_for :venue
end
