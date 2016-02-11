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

ActiveRecord::Schema.define(version: 20160209181413) do

  create_table "appointments", force: :cascade do |t|
    t.date     "day"
    t.integer  "suggestion_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "appointments", ["suggestion_id"], name: "index_appointments_on_suggestion_id"

  create_table "datings", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "appointment_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  add_index "datings", ["appointment_id"], name: "index_datings_on_appointment_id"
  add_index "datings", ["user_id"], name: "index_datings_on_user_id"

  create_table "invitations", force: :cascade do |t|
    t.string   "invitee_tel"
    t.string   "days_inviter"
    t.string   "invitee_name"
    t.integer  "inviter_id"
    t.integer  "invitee_id"
    t.boolean  "confirmed",    default: false
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  create_table "rainchecks", force: :cascade do |t|
    t.integer  "invitation_id"
    t.string   "days_rainchecker"
    t.boolean  "confirmed",        default: false
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
  end

  add_index "rainchecks", ["invitation_id"], name: "index_rainchecks_on_invitation_id"

  create_table "suggestings", force: :cascade do |t|
    t.integer  "suggestion_id"
    t.integer  "invitation_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "suggestings", ["invitation_id"], name: "index_suggestings_on_invitation_id"
  add_index "suggestings", ["suggestion_id"], name: "index_suggestings_on_suggestion_id"

  create_table "suggestions", force: :cascade do |t|
    t.string   "name"
    t.text     "description"
    t.string   "photo"
    t.string   "ext_link"
    t.integer  "candy",       default: 0
    t.boolean  "taken",       default: false
    t.boolean  "event",       default: false
    t.boolean  "public",      default: true
    t.integer  "user_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
  end

  add_index "suggestions", ["user_id"], name: "index_suggestions_on_user_id"

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
