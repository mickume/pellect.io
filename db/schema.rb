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

ActiveRecord::Schema.define(version: 20140417152942) do

  create_table "bookmarks", force: true do |t|
    t.integer  "user_id"
    t.string   "url_shortened"
    t.string   "description"
    t.integer  "view_count"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "url_shortened_pub"
    t.integer  "resource_id"
    t.integer  "site_id"
    t.integer  "time_to_expiration"
  end

  add_index "bookmarks", ["created_at"], name: "index_bookmarks_on_created_at", using: :btree
  add_index "bookmarks", ["resource_id"], name: "index_bookmarks_on_resource_id", using: :btree
  add_index "bookmarks", ["site_id"], name: "index_bookmarks_on_site_id", using: :btree
  add_index "bookmarks", ["time_to_expiration"], name: "index_bookmarks_on_time_to_expiration", using: :btree
  add_index "bookmarks", ["updated_at"], name: "index_bookmarks_on_updated_at", using: :btree
  add_index "bookmarks", ["url_shortened"], name: "index_bookmarks_on_url_shortened", using: :btree
  add_index "bookmarks", ["url_shortened_pub"], name: "index_bookmarks_on_url_shortened_pub", using: :btree
  add_index "bookmarks", ["user_id"], name: "index_bookmarks_on_user_id", using: :btree
  add_index "bookmarks", ["view_count"], name: "index_bookmarks_on_view_count", using: :btree

  create_table "resources", force: true do |t|
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "site_id"
    t.string   "url"
    t.string   "title"
  end

  add_index "resources", ["url"], name: "index_resources_on_url", using: :btree

  create_table "roles", force: true do |t|
    t.string   "name"
    t.integer  "resource_id"
    t.string   "resource_type"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "roles", ["name", "resource_type", "resource_id"], name: "index_roles_on_name_and_resource_type_and_resource_id", using: :btree
  add_index "roles", ["name"], name: "index_roles_on_name", using: :btree

  create_table "sites", force: true do |t|
    t.string   "host"
    t.string   "favicon"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "sites", ["host"], name: "index_sites_on_host", using: :btree

  create_table "users", force: true do |t|
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
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "name"
    t.string   "confirmation_token"
    t.datetime "confirmed_at"
    t.datetime "confirmation_sent_at"
    t.string   "unconfirmed_email"
    t.boolean  "blocked"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  create_table "users_roles", id: false, force: true do |t|
    t.integer "user_id"
    t.integer "role_id"
  end

  add_index "users_roles", ["user_id", "role_id"], name: "index_users_roles_on_user_id_and_role_id", using: :btree

end
