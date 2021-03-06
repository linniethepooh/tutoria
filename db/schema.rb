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

ActiveRecord::Schema.define(version: 2018_08_15_081406) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "hstore"
  enable_extension "plpgsql"

  create_table "answers", force: :cascade do |t|
    t.string "content"
    t.string "headline"
    t.bigint "question_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["question_id"], name: "index_answers_on_question_id"
  end

  create_table "companies", force: :cascade do |t|
    t.string "name"
    t.string "main_logo"
    t.string "optional_logo"
    t.jsonb "styling_preferences"
    t.string "address"
    t.string "city"
    t.string "zipcode"
    t.string "country"
    t.string "banner"
    t.string "website"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "questions", force: :cascade do |t|
    t.string "content"
    t.bigint "step_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "answered", default: false
    t.index ["step_id"], name: "index_questions_on_step_id"
  end

  create_table "ratings", force: :cascade do |t|
    t.bigint "tutorial_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutorial_id"], name: "index_ratings_on_tutorial_id"
  end

  create_table "steps", force: :cascade do |t|
    t.bigint "tutorial_id"
    t.integer "start_time"
    t.text "description"
    t.string "headline"
    t.text "materials"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["tutorial_id"], name: "index_steps_on_tutorial_id"
  end

  create_table "tutorials", force: :cascade do |t|
    t.string "subtitle"
    t.string "product"
    t.text "materials"
    t.string "title"
    t.text "description"
    t.boolean "public", default: false
    t.bigint "company_id"
    t.string "file"
    t.string "filehigh"
    t.string "filemedium"
    t.string "filelow"
    t.string "image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.hstore "rawsubtitles", default: {}, null: false
    t.index ["company_id"], name: "index_tutorials_on_company_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.string "username"
    t.string "first_name"
    t.string "last_name"
    t.integer "status", default: 0, null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "company_id"
    t.string "invitation_token"
    t.datetime "invitation_created_at"
    t.datetime "invitation_sent_at"
    t.datetime "invitation_accepted_at"
    t.integer "invitation_limit"
    t.string "invited_by_type"
    t.bigint "invited_by_id"
    t.integer "invitations_count", default: 0
    t.boolean "admin", default: false, null: false
    t.index ["company_id"], name: "index_users_on_company_id"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["invitation_token"], name: "index_users_on_invitation_token", unique: true
    t.index ["invitations_count"], name: "index_users_on_invitations_count"
    t.index ["invited_by_id"], name: "index_users_on_invited_by_id"
    t.index ["invited_by_type", "invited_by_id"], name: "index_users_on_invited_by_type_and_invited_by_id"
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "views", force: :cascade do |t|
    t.time "start_time"
    t.time "end_time"
    t.string "location"
    t.string "device"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.bigint "tutorial_id"
    t.index ["tutorial_id"], name: "index_views_on_tutorial_id"
  end

  add_foreign_key "answers", "questions"
  add_foreign_key "questions", "steps"
  add_foreign_key "ratings", "tutorials"
  add_foreign_key "steps", "tutorials"
  add_foreign_key "tutorials", "companies"
  add_foreign_key "users", "companies"
  add_foreign_key "views", "tutorials"
end
