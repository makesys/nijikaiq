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

ActiveRecord::Schema.define(version: 20140907120816) do

  create_table "project_quizzes", force: true do |t|
    t.integer "project_id"
    t.integer "quiz_id"
  end

  create_table "projects", force: true do |t|
    t.integer  "user_id"
    t.string   "title"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "projcode"
    t.string   "text"
  end

  add_index "projects", ["user_id"], name: "index_projects_on_user_id", using: :btree

  create_table "quiztypes", force: true do |t|
    t.string   "quiztype_name"
    t.string   "quiztype_description"
    t.string   "quiztype_def1"
    t.string   "quiztype_def2"
    t.string   "quiztype_def3"
    t.string   "quiztype_def4"
    t.string   "quiztype_def5"
    t.string   "quiztype_def6"
    t.string   "quiztype_def7"
    t.string   "quiztype_def8"
    t.string   "quiztype_def9"
    t.string   "quiztype_def10"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "quizzes", force: true do |t|
    t.integer  "quiztype_id"
    t.string   "owner_user_id"
    t.string   "quiz_title"
    t.text     "quiz_text"
    t.string   "quiz_parts1"
    t.string   "quiz_parts2"
    t.string   "quiz_parts3"
    t.string   "quiz_parts4"
    t.string   "quiz_parts5"
    t.string   "quiz_parts6"
    t.string   "quiz_parts7"
    t.string   "quiz_parts8"
    t.string   "quiz_parts9"
    t.string   "quiz_parts10"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.integer  "order"
    t.string   "answer"
  end

  add_index "quizzes", ["quiztype_id"], name: "index_quizzes_on_quiztype_id", using: :btree

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "fname"
    t.string   "lname"
    t.string   "password_digest"
    t.string   "birth"
    t.string   "gender"
    t.string   "nickname"
    t.string   "qpoint"
    t.string   "dmagree"
    t.string   "del_flag"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.binary   "icon",            limit: 16777215
  end

  add_index "users", ["remember_token"], name: "index_users_on_remember_token", using: :btree

end
