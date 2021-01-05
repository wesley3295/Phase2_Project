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

ActiveRecord::Schema.define(version: 20201230232514) do

  create_table "champions", force: :cascade do |t|
    t.float   "Attack"
    t.float   "Defense"
    t.float   "Magic"
    t.float   "Difficulty"
    t.float   "Hp"
    t.float   "HpUpPerLevel"
    t.float   "Mp"
    t.float   "MpUpPerLevel"
    t.float   "MoveSpeed"
    t.float   "Armor"
    t.float   "ArmorPerLevel"
    t.float   "SpellBlock"
    t.float   "SpellBlockPerLevel"
    t.float   "AttackRange"
    t.float   "HpRegen"
    t.float   "HpRegenPerLevel"
    t.float   "MpRegen"
    t.float   "MpRegenPerLevel"
    t.float   "AttackDamage"
    t.float   "AttackDamagePerLevel"
    t.float   "AttackSpeedOffset"
    t.integer "ChampionId"
    t.string  "Name"
    t.string  "Title"
  end

  create_table "team_champions", force: :cascade do |t|
    t.integer "champion_id"
    t.integer "team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string   "team_name"
    t.integer  "user_id"
    t.integer  "wins",       default: 0
    t.integer  "loses",      default: 0
    t.datetime "created_at",             null: false
    t.datetime "updated_at",             null: false
  end

  create_table "users", force: :cascade do |t|
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
  end

end
