class CreateVenueSuggestions < ActiveRecord::Migration[5.2]
  def change
    create_table :venue_suggestions, id: :uuid do |t|
      t.string :name, null: false
      t.references :event, foreign_key: { on_delete: :cascade, on_update: :cascade }, type: :uuid

      t.timestamps
    end
  end
end
