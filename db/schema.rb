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

ActiveRecord::Schema.define(version: 20161213115535) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "appointments", force: :cascade do |t|
    t.date     "date"
    t.string   "status"
    t.integer  "user_id"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_appointments_on_asset_id", using: :btree
    t.index ["user_id"], name: "index_appointments_on_user_id", using: :btree
  end

  create_table "asset_photos", force: :cascade do |t|
    t.integer  "asset_id"
    t.string   "photo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_asset_photos_on_asset_id", using: :btree
  end

  create_table "assets", force: :cascade do |t|
    t.string   "title"
    t.string   "description"
    t.integer  "price"
    t.string   "address"
    t.string   "country"
    t.string   "city"
    t.string   "region"
    t.string   "condition"
    t.integer  "year_built"
    t.integer  "year_reno"
    t.integer  "bedrooms"
    t.integer  "bathrooms"
    t.integer  "garage"
    t.integer  "lots_size"
    t.string   "previous_owners"
    t.string   "status"
    t.integer  "user_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.float    "latitude"
    t.float    "longitude"
    t.string   "post_code"
    t.text     "photos"
    t.index ["user_id"], name: "index_assets_on_user_id", using: :btree
  end

  create_table "favorite_assets", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "asset_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_favorite_assets_on_asset_id", using: :btree
    t.index ["user_id"], name: "index_favorite_assets_on_user_id", using: :btree
  end

  create_table "groups", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "investments", force: :cascade do |t|
    t.integer  "sum"
    t.float    "return"
    t.integer  "user_id"
    t.integer  "asset_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_investments_on_asset_id", using: :btree
    t.index ["group_id"], name: "index_investments_on_group_id", using: :btree
    t.index ["user_id"], name: "index_investments_on_user_id", using: :btree
  end

  create_table "offers", force: :cascade do |t|
    t.date     "offer_date"
    t.string   "status"
    t.string   "offer_type"
    t.integer  "asset_id"
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["asset_id"], name: "index_offers_on_asset_id", using: :btree
    t.index ["user_id"], name: "index_offers_on_user_id", using: :btree
  end

  create_table "subscribe_to_newsletter_services", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "user_groups", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "group_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["group_id"], name: "index_user_groups_on_group_id", using: :btree
    t.index ["user_id"], name: "index_user_groups_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "",    null: false
    t.string   "encrypted_password",     default: "",    null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,     null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet     "current_sign_in_ip"
    t.inet     "last_sign_in_ip"
    t.date     "birthdate"
    t.string   "company"
    t.datetime "created_at",                             null: false
    t.datetime "updated_at",                             null: false
    t.boolean  "superadmin_role",        default: false
    t.boolean  "seller_role",            default: false
    t.boolean  "user_role",              default: true
    t.string   "provider"
    t.string   "uid"
    t.string   "facebook_picture_url"
    t.string   "first_name"
    t.string   "last_name"
    t.string   "token"
    t.datetime "token_expiry"
    t.string   "photo"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "appointments", "assets"
  add_foreign_key "appointments", "users"
  add_foreign_key "asset_photos", "assets"
  add_foreign_key "assets", "users"
  add_foreign_key "favorite_assets", "assets"
  add_foreign_key "favorite_assets", "users"
  add_foreign_key "investments", "assets"
  add_foreign_key "investments", "groups"
  add_foreign_key "investments", "users"
  add_foreign_key "offers", "assets"
  add_foreign_key "offers", "users"
  add_foreign_key "user_groups", "groups"
  add_foreign_key "user_groups", "users"
end
