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

ActiveRecord::Schema.define(version: 2021_10_11_194446) do

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
    t.string "email", default: "", null: false
    t.boolean "is_home_during_day", null: false
    t.integer "transportation", null: false
    t.string "street", null: false
    t.string "apt"
    t.string "phone", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at", precision: 6
    t.datetime "remember_created_at", precision: 6
    t.boolean "admin", default: false, null: false
    t.index ["email"], name: "index_fosters_on_email", unique: true
    t.index ["reset_password_token"], name: "index_fosters_on_reset_password_token", unique: true
  end

  create_table "homes", force: :cascade do |t|
    t.boolean "has_children", default: false
    t.boolean "has_fenced_yard", default: false
    t.boolean "has_other_adults", default: false
    t.boolean "has_other_dog", default: false
    t.boolean "has_other_cat", default: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "passwordless_sessions", force: :cascade do |t|
    t.string "authenticatable_type"
    t.bigint "authenticatable_id"
    t.datetime "timeout_at", precision: 6, null: false
    t.datetime "expires_at", precision: 6, null: false
    t.datetime "claimed_at", precision: 6
    t.text "user_agent", null: false
    t.string "remote_addr", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["authenticatable_type", "authenticatable_id"], name: "authenticatable"
  end

  create_table "rescues", force: :cascade do |t|
    t.string "file_name"
    t.string "email"
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

end
