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

ActiveRecord::Schema.define(version: 20160609115957) do

  create_table "comments", force: :cascade do |t|
    t.string  "username",  limit: 255
    t.string  "comment",   limit: 255
    t.integer "recipe_id", limit: 4
  end

  add_index "comments", ["recipe_id"], name: "fk_rails_fa790d5166", using: :btree

  create_table "cuisines", force: :cascade do |t|
    t.string   "cuisine",    limit: 255
    t.string   "masakan",    limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ingredients", force: :cascade do |t|
    t.string   "ingredient", limit: 255
    t.string   "ramuan",     limit: 255
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id",     limit: 4
    t.integer "ingredient_id", limit: 4
  end

  add_index "ingredients_recipes", ["ingredient_id"], name: "fk_rails_e254ded715", using: :btree
  add_index "ingredients_recipes", ["recipe_id"], name: "fk_rails_8f63238379", using: :btree

  create_table "occasions", force: :cascade do |t|
    t.string "occasion", limit: 255
    t.string "majlis",   limit: 255
  end

  create_table "occasions_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id",   limit: 4
    t.integer "occasion_id", limit: 4
  end

  add_index "occasions_recipes", ["occasion_id"], name: "fk_rails_87f15cda82", using: :btree
  add_index "occasions_recipes", ["recipe_id"], name: "fk_rails_028ffe8094", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string  "recipe",      limit: 255
    t.string  "resipi",      limit: 255
    t.integer "cuisine_id",  limit: 4
    t.string  "instruction", limit: 10000
    t.string  "arahan",      limit: 10000
    t.string  "time",        limit: 255
    t.string  "photo",       limit: 255
    t.decimal "rating",                    precision: 5, scale: 2
  end

  add_index "recipes", ["cuisine_id"], name: "fk_rails_be504d0fa1", using: :btree

  create_table "users", force: :cascade do |t|
    t.string   "email",                  limit: 255, default: "", null: false
    t.string   "encrypted_password",     limit: 255, default: "", null: false
    t.string   "reset_password_token",   limit: 255
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          limit: 4,   default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip",     limit: 255
    t.string   "last_sign_in_ip",        limit: 255
    t.datetime "created_at",                                      null: false
    t.datetime "updated_at",                                      null: false
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true, using: :btree
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree

  add_foreign_key "comments", "recipes", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ingredients_recipes", "ingredients", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ingredients_recipes", "recipes", on_update: :cascade, on_delete: :cascade
  add_foreign_key "occasions_recipes", "occasions", on_update: :cascade, on_delete: :cascade
  add_foreign_key "occasions_recipes", "recipes", on_update: :cascade, on_delete: :cascade
  add_foreign_key "recipes", "cuisines", on_update: :cascade, on_delete: :cascade
end
