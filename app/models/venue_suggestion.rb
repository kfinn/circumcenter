class VenueSuggestion < ApplicationRecord
  validates :google_place_id, presence: true, uniqueness: { scope: :event_id }
  validate :place_details_must_exist

  belongs_to :event
  has_many :endorsements, inverse_of: :venue_suggestion
  has_many :vetoes, inverse_of: :venue_suggestion

  after_create :broadcast_to_event

  delegate :name, to: :place_details

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

  private

  def place_details
    @place_details ||= PlaceDetails.find google_place_id
  end

  def place_details_must_exist
    return if place_details.present?
    errors[:google_place_id] << 'Place details must exist'
  end
end
