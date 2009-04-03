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

ActiveRecord::Schema.define(:version => 20090204033020) do

  create_table "accounts", :force => true do |t|
    t.string   "name"
    t.string   "email"
    t.string   "hashed_password"
    t.string   "salt"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.datetime "last_login_at"
  end

  create_table "industry_types", :force => true do |t|
    t.string   "industry_type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "job_types", :force => true do |t|
    t.string   "job_type_name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "myers_briggs_types", :force => true do |t|
    t.string   "mbti_type_name"
    t.text     "mbti_type_description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persona_team_rosters", :force => true do |t|
    t.integer  "persona_team_id"
    t.integer  "persona_id"
    t.string   "job_needs"
    t.string   "life_needs"
    t.string   "rank"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "persona_teams", :force => true do |t|
    t.string   "account_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "persona_team_name"
    t.text     "persona_team_description"
  end

  create_table "personas", :force => true do |t|
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "age"
    t.string   "gender"
    t.string   "ethnicity"
    t.string   "myers_briggs_id"
    t.string   "photo_id"
    t.string   "industry_id"
    t.string   "job_type_id"
    t.string   "job_description"
    t.string   "life_description"
    t.string   "Status"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "photos", :force => true do |t|
    t.string "description"
    t.string "content_type"
    t.string "filename"
    t.binary "binary_data"
  end

end
