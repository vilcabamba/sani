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

ActiveRecord::Schema.define(version: 20140114045655) do

  create_table "bandangos", force: true do |t|
    t.integer  "business_id", null: false
    t.string   "name"
    t.string   "token",       null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "bandangos", ["business_id"], name: "index_bandangos_on_business_id", using: :btree
  add_index "bandangos", ["token"], name: "index_bandangos_on_token", unique: true, using: :btree

  create_table "businesses", force: true do |t|
    t.string   "nombre",     null: false
    t.string   "token",      null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "businesses", ["nombre"], name: "index_businesses_on_nombre", unique: true, using: :btree
  add_index "businesses", ["token"], name: "index_businesses_on_token", unique: true, using: :btree

  create_table "models", force: true do |t|
    t.string   "name",          null: false
    t.string   "identificator", null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "models", ["name"], name: "index_models_on_name", unique: true, using: :btree

  create_table "transacciones", force: true do |t|
    t.integer  "bandango_id", null: false
    t.string   "model",       null: false
    t.string   "action",      null: false
    t.text     "attrs"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "time",        null: false
  end

  add_index "transacciones", ["bandango_id"], name: "index_transacciones_on_bandango_id", using: :btree
  add_index "transacciones", ["time"], name: "index_transacciones_on_time", using: :btree

end
