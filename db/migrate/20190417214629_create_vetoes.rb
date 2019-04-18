class CreateVetoes < ActiveRecord::Migration[5.2]
  def change
    create_table :vetoes, id: :uuid do |t|
      t.references :venue_suggestion, foreign_key: { on_delete: :cascade, on_update: :cascade }, type: :uuid

      t.timestamps
    end
  end
end
