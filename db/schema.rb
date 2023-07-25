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

ActiveRecord::Schema[7.0].define(version: 2023_07_25_172622) do
  create_table "candidates", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "election_id", null: false
    t.string "name"
    t.datetime "startdate"
    t.datetime "enddate"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["election_id"], name: "index_candidates_on_election_id"
    t.index ["user_id"], name: "index_candidates_on_user_id"
  end

  create_table "elections", force: :cascade do |t|
    t.integer "user_id", null: false
    t.string "name"
    t.string "description"
    t.integer "number_of_votes"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_elections_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "phone"
    t.string "password_digest"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "votes", force: :cascade do |t|
    t.integer "user_id", null: false
    t.integer "election_id", null: false
    t.integer "candidate_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["candidate_id"], name: "index_votes_on_candidate_id"
    t.index ["election_id"], name: "index_votes_on_election_id"
    t.index ["user_id"], name: "index_votes_on_user_id"
  end

  add_foreign_key "candidates", "elections"
  add_foreign_key "candidates", "users"
  add_foreign_key "elections", "users"
  add_foreign_key "votes", "candidates"
  add_foreign_key "votes", "elections"
  add_foreign_key "votes", "users"
end
