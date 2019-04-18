# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_04_17_214629) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "pgcrypto"
  enable_extension "plpgsql"

  create_table "endorsements", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "venue_suggestion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_suggestion_id"], name: "index_endorsements_on_venue_suggestion_id"
  end

  create_table "events", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.datetime "start", null: false
  end

  create_table "venue_suggestions", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.string "name", null: false
    t.uuid "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_venue_suggestions_on_event_id"
  end

  create_table "vetoes", id: :uuid, default: -> { "gen_random_uuid()" }, force: :cascade do |t|
    t.uuid "venue_suggestion_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["venue_suggestion_id"], name: "index_vetoes_on_venue_suggestion_id"
  end

  add_foreign_key "endorsements", "venue_suggestions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "venue_suggestions", "events", on_update: :cascade, on_delete: :cascade
  add_foreign_key "vetoes", "venue_suggestions", on_update: :cascade, on_delete: :cascade
end
