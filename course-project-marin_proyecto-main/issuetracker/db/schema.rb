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

ActiveRecord::Schema[7.0].define(version: 2022_04_30_190638) do
  create_table "comments", force: :cascade do |t|
    t.string "comment"
    t.datetime "comment_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id", null: false
    t.integer "user_id", null: false
    t.index ["ticket_id"], name: "index_comments_on_ticket_id"
    t.index ["user_id"], name: "index_comments_on_user_id"
  end

  create_table "performances", force: :cascade do |t|
    t.integer "evaluation"
    t.integer "user_id"
    t.integer "executive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["executive_id"], name: "index_performances_on_executive_id"
    t.index ["user_id"], name: "index_performances_on_user_id"
  end

  create_table "responses", force: :cascade do |t|
    t.string "response"
    t.datetime "response_date"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "ticket_id", null: false
    t.integer "user_id", null: false
    t.index ["ticket_id"], name: "index_responses_on_ticket_id"
    t.index ["user_id"], name: "index_responses_on_user_id"
  end

  create_table "rolls", force: :cascade do |t|
    t.string "roll"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "tickets", force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.string "category"
    t.datetime "creation_date"
    t.datetime "resolution_date"
    t.datetime "limit_date"
    t.string "priority"
    t.string "state"
    t.string "tags"
    t.boolean "docs"
    t.string "key_resolution"
    t.integer "user_id"
    t.integer "executive_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["executive_id"], name: "index_tickets_on_executive_id"
    t.index ["user_id"], name: "index_tickets_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "first_name"
    t.string "last_name"
    t.string "phone"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "roll_id", null: false
    t.index ["roll_id"], name: "index_users_on_roll_id"
  end

  add_foreign_key "comments", "tickets"
  add_foreign_key "comments", "users"
  add_foreign_key "performances", "users"
  add_foreign_key "performances", "users", column: "executive_id"
  add_foreign_key "responses", "tickets"
  add_foreign_key "responses", "users"
  add_foreign_key "tickets", "users"
  add_foreign_key "tickets", "users", column: "executive_id"
  add_foreign_key "users", "rolls"
end
