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

ActiveRecord::Schema.define(version: 20160506044447) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "labels", force: :cascade do |t|
    t.string   "name"
    t.integer  "transaction_id"
    t.integer  "user_id"
    t.boolean  "mint"
    t.datetime "created_at",     null: false
    t.datetime "updated_at",     null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.integer  "user_id"
    t.string   "mint_date"
    t.string   "mint_description"
    t.string   "mint_original_description"
    t.float    "mint_amount"
    t.string   "mint_transaction_type"
    t.string   "mint_category"
    t.string   "mint_account_name"
    t.string   "mint_labels"
    t.string   "mint_notes"
    t.integer  "day_number_of_week"
    t.integer  "day_number_of_month"
    t.string   "day_of_week"
    t.string   "month"
    t.integer  "month_number"
    t.integer  "year"
    t.float    "transaction_amount"
    t.float    "transaction_abs_amount"
    t.string   "transaction_debit_credit"
    t.string   "shared_cost"
    t.string   "boolean"
    t.float    "shared_percent"
    t.integer  "shared_user_id"
    t.string   "financial_institution"
    t.string   "merchant"
    t.string   "category"
    t.string   "fabricated_id"
    t.boolean  "possible_duplicate"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
