# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema[8.0].define(version: 2025_01_26_130204) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "pg_catalog.plpgsql"

  create_table "chemicals", id: :bigint, default: nil, force: :cascade do |t|
    t.text "name", null: false
  end

  create_table "concentrations", id: :bigint, default: nil, force: :cascade do |t|
    t.bigint "chemical_id", null: false
    t.float "concentration", null: false
    t.bigint "sample_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["sample_id"], name: "index_concentrations_on_sample_id"
  end

  create_table "samples", force: :cascade do |t|
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "water_quality_tests", id: :bigint, default: nil, force: :cascade do |t|
    t.float "ph"
    t.float "orp"
    t.text "uv_vis"
    t.bigint "sample_id", null: false
    t.datetime "created_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.datetime "updated_at", default: -> { "CURRENT_TIMESTAMP" }, null: false
    t.index ["sample_id"], name: "index_water_quality_tests_on_sample_id"
  end

  add_foreign_key "concentrations", "samples"
  add_foreign_key "water_quality_tests", "samples"
end
