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

ActiveRecord::Schema.define(version: 20170606100737) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "subjects", force: :cascade do |t|
    t.string   "sub_id"
    t.string   "sub_name"
    t.text     "sub_des"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "user_id"
    t.index ["sub_id", "sub_name"], name: "index_subjects_on_sub_id_and_sub_name", unique: true, using: :btree
    t.index ["user_id"], name: "index_subjects_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "image_url"
    t.string   "uid"
    t.string   "stu_name"
    t.string   "stu_id"
    t.string   "stu_fac"
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.boolean  "superadmin_role", default: false
    t.boolean  "supervisor_role", default: false
    t.boolean  "user_role",       default: true
    t.index ["uid"], name: "index_users_on_uid", using: :btree
  end

  create_table "votes", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "subject_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["subject_id", "user_id"], name: "index_votes_on_subject_id_and_user_id", unique: true, using: :btree
    t.index ["subject_id"], name: "index_votes_on_subject_id", using: :btree
    t.index ["user_id"], name: "index_votes_on_user_id", using: :btree
  end

  add_foreign_key "subjects", "users"
  add_foreign_key "votes", "subjects"
  add_foreign_key "votes", "users"
end
