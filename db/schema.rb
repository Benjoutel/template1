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

ActiveRecord::Schema.define(version: 20171212123914) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "allergies", force: :cascade do |t|
    t.string   "name"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_allergies_on_patient_id", using: :btree
  end

  create_table "antecedents", force: :cascade do |t|
    t.text     "description"
    t.integer  "patient_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["patient_id"], name: "index_antecedents_on_patient_id", using: :btree
  end

  create_table "caregivers", force: :cascade do |t|
    t.string   "firstname"
    t.string   "lastname"
    t.string   "address"
    t.string   "mail"
    t.string   "phone_number"
    t.string   "speciality"
    t.integer  "patient_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "photo"
    t.index ["patient_id"], name: "index_caregivers_on_patient_id", using: :btree
  end

  create_table "documents", force: :cascade do |t|
    t.string   "category"
    t.string   "document"
    t.string   "name"
    t.integer  "event_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["event_id"], name: "index_documents_on_event_id", using: :btree
  end

  create_table "episodes", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.integer  "patient_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "icon"
    t.index ["patient_id"], name: "index_episodes_on_patient_id", using: :btree
  end

  create_table "events", force: :cascade do |t|
    t.date     "date"
    t.text     "description"
    t.string   "category"
    t.integer  "episode_id"
    t.integer  "caregiver_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.string   "icon"
    t.index ["caregiver_id"], name: "index_events_on_caregiver_id", using: :btree
    t.index ["episode_id"], name: "index_events_on_episode_id", using: :btree
  end

  create_table "measures", force: :cascade do |t|
    t.string   "name"
    t.integer  "value"
    t.date     "date"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_measures_on_patient_id", using: :btree
  end

  create_table "patients", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "firstname"
    t.string   "lastname"
    t.date     "birth_date"
    t.string   "address"
    t.string   "phone_number"
    t.string   "photo"
    t.string   "insee"
    t.string   "nationality"
    t.string   "civil_status"
    t.string   "birth_place"
    t.index ["email"], name: "index_patients_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_patients_on_reset_password_token", unique: true, using: :btree
  end

  create_table "pictos", force: :cascade do |t|
    t.string   "name"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "vaccinations", force: :cascade do |t|
    t.string   "vaccin"
    t.date     "date"
    t.string   "recall"
    t.integer  "patient_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["patient_id"], name: "index_vaccinations_on_patient_id", using: :btree
  end

  add_foreign_key "allergies", "patients"
  add_foreign_key "antecedents", "patients"
  add_foreign_key "caregivers", "patients"
  add_foreign_key "documents", "events"
  add_foreign_key "episodes", "patients"
  add_foreign_key "events", "caregivers"
  add_foreign_key "events", "episodes"
  add_foreign_key "measures", "patients"
  add_foreign_key "vaccinations", "patients"
end
