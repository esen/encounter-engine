# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 19) do

  create_table "game_passings", :force => true do |t|
    t.integer  "game_id"
    t.integer  "team_id"
    t.integer  "current_level_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "finished_at"
    t.datetime "current_level_entered_at"
    t.string   "answered_questions"
  end

  create_table "games", :force => true do |t|
    t.string   "name"
    t.string   "description"
    t.integer  "author_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "starts_at"
    t.boolean  "is_draft",    :default => false, :null => false
  end

  create_table "hints", :force => true do |t|
    t.integer  "level_id"
    t.string   "text"
    t.integer  "delay"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "invitations", :force => true do |t|
    t.integer  "to_team_id"
    t.integer  "for_user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "levels", :force => true do |t|
    t.text     "text"
    t.integer  "game_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "position"
    t.string   "name"
  end

  create_table "sessions", :force => true do |t|
    t.string   "session_id"
    t.text     "data"
    t.datetime "created_at"
  end

  create_table "teams", :force => true do |t|
    t.string   "name"
    t.integer  "captain_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "email"
    t.string   "nickname"
    t.string   "crypted_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "block",            :null => false
    t.integer  "team_id"
  end

end
