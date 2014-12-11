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

ActiveRecord::Schema.define(version: 20141211005426) do

  create_table "cards", force: true do |t|
    t.integer  "cardtype",                    null: false
    t.integer  "game_id",                     null: false
    t.integer  "player_id"
    t.boolean  "used",        default: false
    t.text     "description",                 null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "cards", ["game_id"], name: "index_cards_on_game_id"
  add_index "cards", ["player_id"], name: "index_cards_on_player_id"

  create_table "games", force: true do |t|
    t.integer  "status",     default: 0, null: false
    t.integer  "turn",       default: 0
    t.integer  "winner",     default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "host"
  end

  create_table "gametiles", force: true do |t|
    t.integer  "tiletype",                  null: false
    t.string   "name",                      null: false
    t.integer  "player_id"
    t.integer  "game_id",                   null: false
    t.text     "description",               null: false
    t.float    "mortgage",    default: 0.0, null: false
    t.float    "cost",        default: 0.0, null: false
    t.integer  "color",                     null: false
    t.integer  "position",                  null: false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "gametiles", ["game_id"], name: "index_gametiles_on_game_id"
  add_index "gametiles", ["player_id"], name: "index_gametiles_on_player_id"

  create_table "players", force: true do |t|
    t.integer  "game_id",                    null: false
    t.integer  "user_id"
    t.float    "balance",    default: 300.0
    t.integer  "position",   default: 0
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "email"
  end

  add_index "players", ["game_id"], name: "index_players_on_game_id"
  add_index "players", ["user_id"], name: "index_players_on_user_id"

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
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
