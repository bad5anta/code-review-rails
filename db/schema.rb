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

ActiveRecord::Schema.define(version: 20171204123933) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "diffs", force: :cascade do |t|
    t.jsonb "code_changes"
    t.string "status", default: "new"
    t.bigint "author_id"
    t.bigint "reviewer_id"
    t.bigint "stack_id"
    t.index ["author_id"], name: "index_diffs_on_author_id"
    t.index ["reviewer_id"], name: "index_diffs_on_reviewer_id"
    t.index ["stack_id"], name: "index_diffs_on_stack_id"
  end

  create_table "stacks", force: :cascade do |t|
    t.string "name"
    t.string "icon"
  end

  create_table "stacks_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "stack_id"
    t.index ["stack_id"], name: "index_stacks_users_on_stack_id"
    t.index ["user_id"], name: "index_stacks_users_on_user_id"
  end

  create_table "subscriptions_users", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "subscriber_id"
    t.bigint "stack_id"
    t.integer "kind"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["stack_id"], name: "index_subscriptions_users_on_stack_id"
    t.index ["subscriber_id"], name: "index_subscriptions_users_on_subscriber_id"
    t.index ["user_id"], name: "index_subscriptions_users_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email"
    t.string "name"
    t.text "stack", default: [], array: true
    t.integer "role"
    t.string "label"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest", null: false
  end

  add_foreign_key "diffs", "users", column: "author_id"
  add_foreign_key "diffs", "users", column: "reviewer_id"
  add_foreign_key "subscriptions_users", "stacks"
  add_foreign_key "subscriptions_users", "users"
  add_foreign_key "subscriptions_users", "users", column: "subscriber_id"
end
