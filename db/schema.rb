# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20160119211738) do

  create_table "appointments", force: :cascade do |t|
    t.integer  "available_id"
    t.integer  "suggestion_id"
    t.string   "recommend"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "appointments", ["available_id"], name: "index_appointments_on_available_id"
  add_index "appointments", ["suggestion_id"], name: "index_appointments_on_suggestion_id"

  create_table "availables", force: :cascade do |t|
    t.datetime "slot"
    t.boolean  "taken",      default: false
    t.integer  "user_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "availables", ["user_id"], name: "index_availables_on_user_id"

  create_table "datings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "appointment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "datings", ["appointment_id"], name: "index_datings_on_appointment_id"
  add_index "datings", ["user_id"], name: "index_datings_on_user_id"

  create_table "moods", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "moods_suggestions", id: false, force: :cascade do |t|
    t.integer "mood_id"
    t.integer "suggestion_id"
  end

  create_table "suggestings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "suggestion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "suggestings", ["suggestion_id"], name: "index_suggestings_on_suggestion_id"
  add_index "suggestings", ["user_id"], name: "index_suggestings_on_user_id"

  create_table "suggestions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.string   "ext_link"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.string   "provider"
    t.string   "uid"
    t.string   "name"
    t.string   "image"
    t.string   "telephone"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["provider"], name: "index_users_on_provider"
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  add_index "users", ["uid"], name: "index_users_on_uid"

end
