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

ActiveRecord::Schema[7.0].define(version: 2022_05_05_020054) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "animal_age_preferences", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "animal_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_animal_age_preferences_on_person_id"
  end

  create_table "animal_applications", force: :cascade do |t|
    t.text "inspiration", null: false
    t.datetime "start_date", null: false
    t.datetime "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "animal_gender_preferences", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "animal_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_animal_gender_preferences_on_person_id"
  end

  create_table "animal_kind_preferences", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "animal_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_animal_kind_preferences_on_person_id"
  end

  create_table "animal_size_preferences", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.integer "animal_value"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["person_id"], name: "index_animal_size_preferences_on_person_id"
  end

  create_table "animals", force: :cascade do |t|
    t.string "name", null: false
    t.string "animal_kind", null: false
    t.string "gender", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "breed"
    t.float "weight"
    t.boolean "sterilized", default: false
    t.boolean "microchipped", default: false
    t.date "birthdate"
  end

  create_table "homes", force: :cascade do |t|
    t.boolean "has_children", default: false
    t.boolean "has_fenced_yard", default: false
    t.boolean "has_other_adults", default: false
    t.boolean "has_other_dog", default: false
    t.boolean "has_other_cat", default: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "street"
    t.string "apt"
    t.string "state"
    t.string "city"
    t.string "zip_code"
    t.integer "home_type"
  end

  create_table "passwordless_sessions", force: :cascade do |t|
    t.string "authenticatable_type"
    t.bigint "authenticatable_id"
    t.datetime "timeout_at", precision: nil, null: false
    t.datetime "expires_at", precision: nil, null: false
    t.datetime "claimed_at", precision: nil
    t.text "user_agent", null: false
    t.string "remote_addr", null: false
    t.string "token", null: false
    t.datetime "created_at", precision: nil, null: false
    t.datetime "updated_at", precision: nil, null: false
    t.index ["authenticatable_type", "authenticatable_id"], name: "authenticatable"
  end

  create_table "people", force: :cascade do |t|
    t.string "full_name", null: false
    t.string "nick_name"
    t.string "email", default: "", null: false
    t.boolean "is_home_during_day", null: false
    t.integer "transportation", null: false
    t.string "phone", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "available_from"
    t.datetime "available_to", null: true
    t.index ["email"], name: "index_people_on_email", unique: true
    t.index ["reset_password_token"], name: "index_people_on_reset_password_token", unique: true
  end

  create_table "people_roles", id: false, force: :cascade do |t|
    t.bigint "person_id"
    t.bigint "role_id"
    t.index ["person_id", "role_id"], name: "index_people_roles_on_person_id_and_role_id"
    t.index ["person_id"], name: "index_people_roles_on_person_id"
    t.index ["role_id"], name: "index_people_roles_on_role_id"
  end

  create_table "person_animals", force: :cascade do |t|
    t.bigint "animal_id"
    t.bigint "person_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "person_homes", force: :cascade do |t|
    t.bigint "person_id", null: false
    t.bigint "home_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["home_id"], name: "index_person_homes_on_home_id"
    t.index ["person_id"], name: "index_person_homes_on_person_id"
  end

  create_table "rescues", force: :cascade do |t|
    t.string "file_name"
    t.string "email"
    t.string "name"
    t.string "phone_number"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "roles", force: :cascade do |t|
    t.string "name"
    t.string "resource_type"
    t.bigint "resource_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id"
    t.index ["resource_type", "resource_id"], name: "index_roles_on_resource"
  end

  add_foreign_key "animal_age_preferences", "people"
  add_foreign_key "animal_gender_preferences", "people"
  add_foreign_key "animal_kind_preferences", "people"
  add_foreign_key "animal_size_preferences", "people"
  add_foreign_key "people_roles", "people"
  add_foreign_key "people_roles", "roles"
  add_foreign_key "person_animals", "animals"
  add_foreign_key "person_animals", "people"
  add_foreign_key "person_homes", "homes"
  add_foreign_key "person_homes", "people"
end
