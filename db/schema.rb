# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `rails
# db:schema:load`. When creating a new database, `rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2020_04_15_202220) do

  create_table "passengers", force: :cascade do |t|
    t.string "name"
    t.string "phone"
    t.string "mobility"
  end

  create_table "trips", force: :cascade do |t|
    t.date "date"
    t.time "time"
    t.string "startLocation"
    t.string "endLocation"
    t.integer "riders"
    t.integer "stairs"
    t.string "notes"
    t.integer "passenger_id", null: false
    t.index ["passenger_id"], name: "index_trips_on_passenger_id"
  end

  add_foreign_key "trips", "passengers"
end
