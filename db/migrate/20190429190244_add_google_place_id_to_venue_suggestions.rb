class AddGooglePlaceIdToVenueSuggestions < ActiveRecord::Migration[5.2]
  def change
    VenueSuggestion.all.destroy_all

    remove_column(:venue_suggestions, :name, null: false)

    add_column(
      :venue_suggestions,
      :google_place_id,
      :string,
      null: false,
      index: true
    )

    add_index(:venue_suggestions, [:event_id, :google_place_id], unique: true)
  end
end
