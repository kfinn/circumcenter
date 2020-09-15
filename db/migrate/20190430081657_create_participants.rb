class CreateParticipants < ActiveRecord::Migration[5.2]
  def change
    create_table :participants, id: :uuid do |t|
      t.references :event, foreign_key: { on_delete: :cascade, on_update: :cascade }, null: false, type: :uuid
      t.references :visitor, foreign_key: { on_delete: :cascade, on_update: :cascade }, null: false, type: :uuid
      t.string :name
      t.decimal :latitude
      t.decimal :longitude

      t.timestamps
    end
  end
end
