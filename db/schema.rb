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

ActiveRecord::Schema.define(version: 20161120003337) do

  create_table "accounts", force: :cascade do |t|
    t.integer  "user_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_accounts_on_user_id"
  end

  create_table "plans", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "gender"
    t.string   "age"
    t.string   "land"
    t.string   "period"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string   "banner"
    t.index ["user_id"], name: "index_plans_on_user_id"
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "account_id"
    t.decimal  "value",       precision: 8, scale: 2
    t.string   "source"
    t.string   "description"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "sender_id"
    t.index ["account_id"], name: "index_transactions_on_account_id"
  end

  create_table "users", force: :cascade do |t|
    t.string   "email"
    t.string   "password_hash"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.string   "name"
    t.string   "auth_token"
  end

end
