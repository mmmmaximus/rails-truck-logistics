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

ActiveRecord::Schema.define(version: 2020_11_09_093337) do

  create_table "trucks", force: :cascade do |t|
    t.string "license_plate"
    t.integer "capacity"
    t.integer "model_type_id"
    t.string "color"
    t.string "service_date"
    t.integer "status"
    t.integer "drivers_id"
    t.index ["drivers_id"], name: "index_trucks_on_drivers_id"
    t.index ["model_type_id"], name: "index_trucks_on_model_type_id"
  end

end
