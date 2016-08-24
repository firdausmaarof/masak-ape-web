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

ActiveRecord::Schema.define(version: 20160824040242) do

  create_table "comments", force: :cascade do |t|
    t.string  "username",  limit: 255, null: false
    t.string  "comment",   limit: 255, null: false
    t.integer "recipe_id", limit: 4,   null: false
  end

  add_index "comments", ["recipe_id"], name: "recipe3_key", using: :btree

  create_table "cuisines", force: :cascade do |t|
    t.string "cuisine", limit: 255
    t.string "masakan", limit: 255
  end

  add_index "cuisines", ["cuisine"], name: "cuisine", unique: true, using: :btree
  add_index "cuisines", ["id"], name: "id", using: :btree
  add_index "cuisines", ["id"], name: "id_2", using: :btree
  add_index "cuisines", ["masakan"], name: "masakan", unique: true, using: :btree

  create_table "ingredients", force: :cascade do |t|
    t.string "ingredient", limit: 255
    t.string "ramuan",     limit: 255
  end

  add_index "ingredients", ["ingredient", "ramuan"], name: "ingredient", unique: true, using: :btree
  add_index "ingredients", ["ingredient", "ramuan"], name: "ingredient_2", unique: true, using: :btree
  add_index "ingredients", ["ingredient"], name: "ingredient_3", using: :btree
  add_index "ingredients", ["ingredient"], name: "ingredient_4", unique: true, using: :btree
  add_index "ingredients", ["ramuan"], name: "ramuan", unique: true, using: :btree

  create_table "ingredients_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id",     limit: 4, null: false
    t.integer "ingredient_id", limit: 4, null: false
  end

  add_index "ingredients_recipes", ["ingredient_id"], name: "ingredient_key", using: :btree
  add_index "ingredients_recipes", ["recipe_id"], name: "recipe_key", using: :btree

  create_table "instructions", force: :cascade do |t|
    t.string  "instruction", limit: 255
    t.string  "arahan",      limit: 255
    t.integer "recipe_id",   limit: 4
  end

  add_index "instructions", ["recipe_id"], name: "fk_rails_70ae839088", using: :btree

  create_table "occasions", force: :cascade do |t|
    t.string "occasion", limit: 255
    t.string "majlis",   limit: 255
  end

  add_index "occasions", ["majlis"], name: "majlis", unique: true, using: :btree
  add_index "occasions", ["occasion", "majlis"], name: "occasion", unique: true, using: :btree
  add_index "occasions", ["occasion", "majlis"], name: "occasion_2", unique: true, using: :btree
  add_index "occasions", ["occasion"], name: "occasion_3", unique: true, using: :btree

  create_table "occasions_recipes", id: false, force: :cascade do |t|
    t.integer "recipe_id",   limit: 4, null: false
    t.integer "occasion_id", limit: 4, null: false
  end

  add_index "occasions_recipes", ["occasion_id"], name: "occasion_key", using: :btree
  add_index "occasions_recipes", ["recipe_id"], name: "recipe2_key", using: :btree

  create_table "recipes", force: :cascade do |t|
    t.string  "recipe",      limit: 255,                    null: false
    t.string  "resipi",      limit: 10000,                  null: false
    t.integer "cuisine_id",  limit: 4,                      null: false
    t.string  "instruction", limit: 10000,                  null: false
    t.text    "arahan",      limit: 16777215,               null: false
    t.string  "time",        limit: 10000,                  null: false
    t.string  "photo",       limit: 255,                    null: false
    t.float   "rating",      limit: 24,       default: 0.0, null: false
  end

  add_index "recipes", ["cuisine_id"], name: "cuisine_key", using: :btree

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

  add_foreign_key "comments", "recipes", name: "recipe3_key", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ingredients_recipes", "ingredients", name: "ingredient_key", on_update: :cascade, on_delete: :cascade
  add_foreign_key "ingredients_recipes", "recipes", name: "recipe_key", on_update: :cascade, on_delete: :cascade
  add_foreign_key "instructions", "recipes", on_update: :cascade, on_delete: :cascade
  add_foreign_key "occasions_recipes", "occasions", name: "occasion_key", on_update: :cascade, on_delete: :cascade
  add_foreign_key "occasions_recipes", "recipes", name: "recipe2_key", on_update: :cascade, on_delete: :cascade
  add_foreign_key "recipes", "cuisines", name: "cuisine_key", on_update: :cascade, on_delete: :cascade
end
