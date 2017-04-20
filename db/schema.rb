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

ActiveRecord::Schema.define(version: 20170420134235) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "fabrics", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "brand"
    t.string   "colour"
    t.integer  "count"
    t.decimal  "height"
    t.decimal  "width"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "fabric_type"
    t.index ["user_id"], name: "index_fabrics_on_user_id", using: :btree
  end

  create_table "features", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.integer  "cached_votes_total",      default: 0
    t.integer  "cached_votes_score",      default: 0
    t.integer  "cached_votes_up",         default: 0
    t.integer  "cached_votes_down",       default: 0
    t.integer  "cached_weighted_score",   default: 0
    t.integer  "cached_weighted_total",   default: 0
    t.float    "cached_weighted_average", default: 0.0
    t.index ["cached_votes_down"], name: "index_features_on_cached_votes_down", using: :btree
    t.index ["cached_votes_score"], name: "index_features_on_cached_votes_score", using: :btree
    t.index ["cached_votes_total"], name: "index_features_on_cached_votes_total", using: :btree
    t.index ["cached_votes_up"], name: "index_features_on_cached_votes_up", using: :btree
    t.index ["cached_weighted_average"], name: "index_features_on_cached_weighted_average", using: :btree
    t.index ["cached_weighted_score"], name: "index_features_on_cached_weighted_score", using: :btree
    t.index ["cached_weighted_total"], name: "index_features_on_cached_weighted_total", using: :btree
  end

  create_table "flosses", force: :cascade do |t|
    t.string   "colour"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "brand"
    t.string   "floss_type"
    t.string   "flossnumber"
  end

  create_table "friendly_id_slugs", force: :cascade do |t|
    t.string   "slug",                      null: false
    t.integer  "sluggable_id",              null: false
    t.string   "sluggable_type", limit: 50
    t.string   "scope"
    t.datetime "created_at"
    t.index ["slug", "sluggable_type", "scope"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type_and_scope", unique: true, using: :btree
    t.index ["slug", "sluggable_type"], name: "index_friendly_id_slugs_on_slug_and_sluggable_type", using: :btree
    t.index ["sluggable_id"], name: "index_friendly_id_slugs_on_sluggable_id", using: :btree
    t.index ["sluggable_type"], name: "index_friendly_id_slugs_on_sluggable_type", using: :btree
  end

  create_table "projects", force: :cascade do |t|
    t.string   "name"
    t.text     "notes"
    t.integer  "progress"
    t.string   "status"
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.integer  "user_id"
    t.string   "pattern_name"
    t.string   "pattern_designer"
    t.string   "fabric_brand"
    t.string   "fabric_colour"
    t.string   "fabric_count"
    t.string   "thread_brand"
    t.string   "picture"
    t.date     "start_date"
    t.date     "finish_date"
    t.boolean  "private",          default: false
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

  create_table "releases", force: :cascade do |t|
    t.string   "name"
    t.string   "picture"
    t.integer  "sal_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["sal_id"], name: "index_releases_on_sal_id", using: :btree
  end

  create_table "sals", force: :cascade do |t|
    t.string   "name"
    t.string   "company"
    t.date     "start_date"
    t.date     "end_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "picture"
    t.text     "notes"
    t.string   "link"
    t.integer  "tag_id"
    t.index ["tag_id"], name: "index_sals_on_tag_id", using: :btree
  end

  create_table "taggings", force: :cascade do |t|
    t.integer  "tag_id"
    t.integer  "project_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["project_id"], name: "index_taggings_on_project_id", using: :btree
    t.index ["tag_id"], name: "index_taggings_on_tag_id", using: :btree
  end

  create_table "tags", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "updates", force: :cascade do |t|
    t.string   "picture"
    t.date     "update_date"
    t.integer  "hours"
    t.integer  "project_id"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.index ["project_id"], name: "index_updates_on_project_id", using: :btree
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
    t.string   "username"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
    t.index ["username"], name: "index_users_on_username", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.string   "votable_type"
    t.integer  "votable_id"
    t.string   "voter_type"
    t.integer  "voter_id"
    t.boolean  "vote_flag"
    t.string   "vote_scope"
    t.integer  "vote_weight"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["votable_id", "votable_type", "vote_scope"], name: "index_votes_on_votable_id_and_votable_type_and_vote_scope", using: :btree
    t.index ["voter_id", "voter_type", "vote_scope"], name: "index_votes_on_voter_id_and_voter_type_and_vote_scope", using: :btree
  end

  add_foreign_key "projects", "users"
  add_foreign_key "quantities", "flosses"
  add_foreign_key "quantities", "users"
  add_foreign_key "releases", "sals"
  add_foreign_key "sals", "tags"
  add_foreign_key "taggings", "projects"
  add_foreign_key "taggings", "tags"
  add_foreign_key "user_flosses", "flosses"
  add_foreign_key "user_flosses", "users"
end
