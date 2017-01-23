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

ActiveRecord::Schema.define(version: 20170123145242) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "flosses", force: :cascade do |t|
    t.string   "colour"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "progress"
    t.string   "status"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
    t.integer  "user_id"
    t.string   "pattern_name"
    t.string   "pattern_designer"
    t.string   "fabric_brand"
    t.string   "fabric_colour"
    t.string   "fabric_count"
    t.string   "thread_brand"
    t.string   "picture"
    t.index ["user_id"], name: "index_projects_on_user_id", using: :btree
  end

  create_table "quantities", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "floss_id"
    t.integer  "quantity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["floss_id"], name: "index_quantities_on_floss_id", using: :btree
    t.index ["user_id"], name: "index_quantities_on_user_id", using: :btree
  end

  create_table "user_flosses", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "floss_id"
    t.integer  "floss_quantity", default: 0
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
    t.index ["floss_id"], name: "index_user_flosses_on_floss_id", using: :btree
    t.index ["user_id"], name: "index_user_flosses_on_user_id", using: :btree
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
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "projects", "users"
  add_foreign_key "quantities", "flosses"
  add_foreign_key "quantities", "users"
  add_foreign_key "user_flosses", "flosses"
  add_foreign_key "user_flosses", "users"
end
