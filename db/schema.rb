# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2018_06_08_113536) do

  create_table "candles", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "collection_id"
    t.integer "start_stamp", null: false
    t.decimal "open", precision: 15, scale: 5, null: false
    t.decimal "close", precision: 15, scale: 5, null: false
    t.decimal "low", precision: 15, scale: 5, null: false
    t.decimal "high", precision: 15, scale: 5, null: false
    t.decimal "amount_bought", precision: 15, scale: 8, null: false
    t.decimal "amount_sold", precision: 15, scale: 8, null: false
    t.integer "buys", null: false
    t.integer "sales", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["collection_id"], name: "index_candles_on_collection_id"
  end

  create_table "coins", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "code", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "collections", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "pair_id"
    t.integer "slot", null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id", "slot"], name: "index_collections_on_pair_id_and_slot", unique: true
    t.index ["pair_id"], name: "index_collections_on_pair_id"
  end

  create_table "crono_jobs", charset: "utf8mb3", force: :cascade do |t|
    t.string "job_id", null: false
    t.text "log", size: :long
    t.datetime "last_performed_at"
    t.boolean "healthy"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["job_id"], name: "index_crono_jobs_on_job_id", unique: true
  end

  create_table "fix_orders", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "order_id"
    t.decimal "rate", precision: 15, scale: 5
    t.decimal "amount", precision: 15, scale: 8
    t.string "error"
    t.integer "status", limit: 1, default: 4, null: false
    t.string "x_id"
    t.string "x_pair"
    t.integer "x_type", limit: 1
    t.decimal "x_done_amount", precision: 15, scale: 8
    t.decimal "x_rest_amount", precision: 15, scale: 8
    t.decimal "x_rate", precision: 15, scale: 5
    t.integer "x_timestamp"
    t.decimal "x_base", precision: 15, scale: 8
    t.decimal "x_quote", precision: 15, scale: 5
    t.integer "x_status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["order_id"], name: "index_fix_orders_on_order_id"
  end

  create_table "orders", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "run_id"
    t.decimal "rate", precision: 15, scale: 5
    t.decimal "amount", precision: 15, scale: 8
    t.decimal "fix_rate", precision: 15, scale: 5
    t.decimal "fix_amount", precision: 15, scale: 8
    t.string "error"
    t.integer "status", limit: 1, default: 4, null: false
    t.string "x_id"
    t.string "x_pair"
    t.integer "x_type", limit: 1
    t.decimal "x_done_amount", precision: 15, scale: 8
    t.decimal "x_rest_amount", precision: 15, scale: 8
    t.decimal "x_rate", precision: 15, scale: 5
    t.integer "x_timestamp"
    t.decimal "x_base", precision: 15, scale: 8
    t.decimal "x_quote", precision: 15, scale: 5
    t.integer "x_status", limit: 1
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["run_id"], name: "index_orders_on_run_id"
  end

  create_table "pairs", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "base_id"
    t.bigint "quote_id"
    t.string "name", null: false
    t.string "code", null: false
    t.integer "decimal_places"
    t.decimal "min_price", precision: 10, scale: 5
    t.integer "max_price"
    t.decimal "min_amount", precision: 10, scale: 5
    t.integer "hidden", limit: 1
    t.decimal "fee", precision: 5, scale: 2
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["base_id"], name: "index_pairs_on_base_id"
    t.index ["quote_id"], name: "index_pairs_on_quote_id"
  end

  create_table "patterns", charset: "utf8mb3", force: :cascade do |t|
    t.string "name", null: false
    t.string "title", null: false
    t.integer "mix", limit: 1, default: 0, null: false
    t.text "description"
    t.string "icon"
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_patterns_on_name", unique: true
  end

  create_table "runs", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "pair_id"
    t.integer "kind", limit: 1, default: 0, null: false
    t.decimal "depo", precision: 15, scale: 5, null: false
    t.decimal "last", precision: 15, scale: 5, null: false
    t.float "indent", default: 10.0, null: false
    t.float "overlap", default: 10.0, null: false
    t.float "martingale", default: 15.0, null: false
    t.integer "orders_number", default: 10, null: false
    t.float "profit", default: 1.0, null: false
    t.integer "scale", limit: 1, default: 1, null: false
    t.decimal "stop_loss", precision: 15, scale: 5, null: false
    t.integer "status", limit: 1, default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_runs_on_pair_id"
  end

  create_table "trades", charset: "utf8mb3", force: :cascade do |t|
    t.bigint "pair_id"
    t.integer "kind", limit: 1
    t.decimal "price", precision: 15, scale: 5
    t.decimal "amount", precision: 15, scale: 8
    t.integer "tid"
    t.integer "timestamp"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["pair_id"], name: "index_trades_on_pair_id"
  end

  add_foreign_key "candles", "collections"
  add_foreign_key "collections", "pairs"
  add_foreign_key "fix_orders", "orders"
  add_foreign_key "orders", "runs"
  add_foreign_key "runs", "pairs"
  add_foreign_key "trades", "pairs"
end
