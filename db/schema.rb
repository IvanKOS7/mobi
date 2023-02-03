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

ActiveRecord::Schema[7.0].define(version: 2023_02_02_235111) do
  create_table "achievements", force: :cascade do |t|
    t.string "name"
    t.string "event"
    t.integer "count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "achievements_players", id: false, force: :cascade do |t|
    t.integer "player_id", null: false
    t.integer "achievement_id", null: false
    t.index ["achievement_id", "player_id"], name: "index_achievements_players_on_achievement_id_and_player_id"
    t.index ["player_id", "achievement_id"], name: "index_achievements_players_on_player_id_and_achievement_id"
  end

  create_table "game_events", force: :cascade do |t|
    t.string "event"
    t.integer "count"
    t.integer "player_id"
    t.integer "game_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["game_id"], name: "index_game_events_on_game_id"
    t.index ["player_id"], name: "index_game_events_on_player_id"
  end

  create_table "games", force: :cascade do |t|
    t.integer "home_team_id"
    t.integer "away_team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "players", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "team_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["team_id"], name: "index_players_on_team_id"
  end

  create_table "teams", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_foreign_key "game_events", "games"
  add_foreign_key "game_events", "players"
  add_foreign_key "players", "teams"
end
