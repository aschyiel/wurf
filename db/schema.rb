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

ActiveRecord::Schema.define(version: 20141114045852) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "champion_base_stat_costs", force: :cascade do |t|
    t.integer "champion_id"
    t.decimal "total"
    t.decimal "attackrange"
    t.decimal "mpperlevel"
    t.decimal "mp"
    t.decimal "attackdamage"
    t.decimal "hp"
    t.decimal "hpperlevel"
    t.decimal "attackdamageperlevel"
    t.decimal "armor"
    t.decimal "mpregenperlevel"
    t.decimal "hpregen"
    t.decimal "critperlevel"
    t.decimal "spellblockperlevel"
    t.decimal "mpregen"
    t.decimal "attackspeedperlevel"
    t.decimal "spellblock"
    t.decimal "movespeed"
    t.decimal "attackspeedoffset"
    t.decimal "crit"
    t.decimal "hpregenperlevel"
    t.decimal "armorperlevel"
  end

  create_table "champion_base_stats", force: :cascade do |t|
    t.integer "champion_id"
    t.decimal "attackrange"
    t.decimal "mpperlevel"
    t.decimal "mp"
    t.decimal "attackdamage"
    t.decimal "hp"
    t.decimal "hpperlevel"
    t.decimal "attackdamageperlevel"
    t.decimal "armor"
    t.decimal "mpregenperlevel"
    t.decimal "hpregen"
    t.decimal "critperlevel"
    t.decimal "spellblockperlevel"
    t.decimal "mpregen"
    t.decimal "attackspeedperlevel"
    t.decimal "spellblock"
    t.decimal "movespeed"
    t.decimal "attackspeedoffset"
    t.decimal "crit"
    t.decimal "hpregenperlevel"
    t.decimal "armorperlevel"
  end

  create_table "champions", force: :cascade do |t|
    t.string   "name",       null: false
    t.string   "title",      null: false
    t.integer  "riot_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
