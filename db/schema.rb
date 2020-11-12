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

ActiveRecord::Schema.define(version: 2020_11_12_095831) do

  create_table "cargos", force: :cascade do |t|
    t.text "description", null: false
    t.string "title", null: false
    t.integer "reference_number", null: false
    t.decimal "value", null: false
    t.integer "truck_id"
    t.boolean "paid"
    t.index ["truck_id"], name: "index_cargos_on_truck_id"
  end

  create_table "driver_trucks", force: :cascade do |t|
    t.integer "truck_id"
    t.integer "driver_id"
    t.index ["driver_id"], name: "index_driver_trucks_on_driver_id"
    t.index ["truck_id"], name: "index_driver_trucks_on_truck_id"
  end

  create_table "drivers", force: :cascade do |t|
    t.string "name", null: false
    t.string "license_number", null: false
    t.string "mobile_number", null: false
    t.string "email_address", null: false
    t.integer "age", null: false
    t.text "notes"
    t.boolean "status", null: false
    t.integer "routes_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["routes_id"], name: "index_drivers_on_routes_id"
  end

  create_table "routes", force: :cascade do |t|
    t.string "name", null: false
    t.integer "length_of_time", null: false
    t.integer "truck_id"
    t.index ["truck_id"], name: "index_routes_on_truck_id"
  end

  create_table "trucks", force: :cascade do |t|
    t.string "license_plate"
    t.integer "capacity"
    t.integer "model_type_id"
    t.string "color"
    t.date "service_date"
    t.integer "status"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["model_type_id"], name: "index_trucks_on_model_type_id"
  end

  add_foreign_key "driver_trucks", "drivers"
  add_foreign_key "driver_trucks", "trucks"
end
