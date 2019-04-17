class CreateRecommendations < ActiveRecord::Migration[5.2]
  def change
    create_table :recommendations, id: :uuid do |t|
      t.references :event, foreign_key: { on_delete: :cascade, on_update: :cascade }, type: :uuid
      t.references :venue, foreign_key: { on_delete: :cascade, on_update: :cascade }, type: :uuid

      t.timestamps
    end
  end
end
