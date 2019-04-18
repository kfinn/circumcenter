class VenueSuggestion < ApplicationRecord
  validates :name, presence: true

  belongs_to :event
  has_many :endorsements, inverse_of: :venue_suggestion
  has_many :vetoes, inverse_of: :venue_suggestion

  after_create :broadcast_to_event

  def self.active
    where(<<~SQL.squish)
      NOT EXISTS (
        SELECT #{Veto.table_name}.id FROM #{Veto.table_name}
        WHERE #{Veto.table_name}.venue_suggestion_id = #{table_name}.id
      )
    SQL
  end

  def broadcast_to_event
    EventVenueRecommendationsChannel.broadcast_to(event, {})
  end
end
