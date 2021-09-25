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

ActiveRecord::Schema.define(version: 2021_09_25_140044) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_applications", force: :cascade do |t|
    t.text "inspiration", null: false
    t.datetime "start_date", precision: 6, null: false
    t.datetime "end_date", precision: 6
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "fosters", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "nick_name"
    t.string "email", null: false
    t.boolean "is_home_during_day", null: false
    t.string "street", null: false
    t.string "apt"
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "homes", force: :cascade do |t|
    t.boolean "has_children", default: false
    t.boolean "has_fenced_yard"
    t.boolean "has_other_adults"
    t.boolean "has_other_dog"
    t.boolean "has_other_cat"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
