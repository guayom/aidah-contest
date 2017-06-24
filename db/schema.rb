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

ActiveRecord::Schema.define(version: 20170618025706) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "categories", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.string   "slug"
    t.text     "description"
  end

  create_table "categories_participants", id: false, force: :cascade do |t|
    t.integer "participant_id"
    t.integer "category_id"
    t.index ["category_id"], name: "index_categories_participants_on_category_id", using: :btree
    t.index ["participant_id"], name: "index_categories_participants_on_participant_id", using: :btree
  end

  create_table "delayed_jobs", force: :cascade do |t|
    t.integer  "priority",   default: 0, null: false
    t.integer  "attempts",   default: 0, null: false
    t.text     "handler",                null: false
    t.text     "last_error"
    t.datetime "run_at"
    t.datetime "locked_at"
    t.datetime "failed_at"
    t.string   "locked_by"
    t.string   "queue"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.index ["priority", "run_at"], name: "delayed_jobs_priority", using: :btree
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

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "juries", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_juries_on_user_id", using: :btree
  end

  create_table "parameters", force: :cascade do |t|
    t.string   "title"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "participant_ratings", force: :cascade do |t|
    t.integer  "participant_id"
    t.integer  "category_id"
    t.integer  "parameter_id"
    t.integer  "score"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "jury_id"
    t.index ["category_id"], name: "index_participant_ratings_on_category_id", using: :btree
    t.index ["jury_id"], name: "index_participant_ratings_on_jury_id", using: :btree
    t.index ["parameter_id"], name: "index_participant_ratings_on_parameter_id", using: :btree
    t.index ["participant_id"], name: "index_participant_ratings_on_participant_id", using: :btree
  end

  create_table "participants", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "lastname"
    t.string   "lastname2"
    t.string   "tel"
    t.text     "bio"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["user_id"], name: "index_participants_on_user_id", using: :btree
  end

  create_table "settings", force: :cascade do |t|
    t.text     "terms"
    t.datetime "created_at",        null: false
    t.datetime "updated_at",        null: false
    t.string   "logo_file_name"
    t.string   "logo_content_type"
    t.integer  "logo_file_size"
    t.datetime "logo_updated_at"
  end

  create_table "subscribers", force: :cascade do |t|
    t.string   "email"
    t.string   "name"
    t.integer  "tel"
    t.string   "category"
    t.string   "country"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
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
    t.string   "role"
    t.string   "avatar_file_name"
    t.string   "avatar_content_type"
    t.integer  "avatar_file_size"
    t.datetime "avatar_updated_at"
    t.integer  "participant_id"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.index ["confirmation_token"], name: "index_users_on_confirmation_token", unique: true, using: :btree
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["participant_id"], name: "index_users_on_participant_id", using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "participant_id"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
    t.integer  "user_id"
    t.integer  "category_id"
    t.index ["category_id"], name: "index_votes_on_category_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "juries", "users"
  add_foreign_key "participant_ratings", "categories"
  add_foreign_key "participant_ratings", "juries"
  add_foreign_key "participant_ratings", "parameters"
  add_foreign_key "participant_ratings", "participants"
  add_foreign_key "participants", "users"
  add_foreign_key "users", "participants"
end
