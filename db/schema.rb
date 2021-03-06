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

ActiveRecord::Schema.define(version: 20131129165658) do

  create_table "jobs", force: true do |t|
    t.string   "title"
    t.text     "description"
    t.string   "company_name"
    t.string   "company_url"
    t.text     "company_tagline"
    t.string   "location"
    t.float    "latitude"
    t.float    "longitude"
    t.string   "phone"
    t.string   "salary"
    t.string   "application_deadline"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "stripe_token"
    t.string   "company_logo_file_name"
    t.string   "company_logo_content_type"
    t.integer  "company_logo_file_size"
    t.datetime "company_logo_updated_at"
  end

  create_table "submissions", force: true do |t|
    t.text     "cover_letter"
    t.integer  "user_id"
    t.integer  "job_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "cv_file_name"
    t.string   "cv_content_type"
    t.integer  "cv_file_size"
    t.datetime "cv_updated_at"
  end

  create_table "users", force: true do |t|
    t.string   "name"
    t.string   "username"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "facebook_id"
    t.integer  "twitter_id"
    t.integer  "linkedin_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
