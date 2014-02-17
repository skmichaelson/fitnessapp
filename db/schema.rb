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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20140217185610) do

  create_table "foods", :force => true do |t|
    t.string   "name",                              :null => false
    t.integer  "usda_id",          :default => 0,   :null => false
    t.integer  "calories",         :default => 0,   :null => false
    t.float    "protein",          :default => 0.0, :null => false
    t.float    "fat",              :default => 0.0, :null => false
    t.float    "carbohydrates",    :default => 0.0, :null => false
    t.float    "fiber",            :default => 0.0, :null => false
    t.integer  "calcium",          :default => 0
    t.float    "iron",             :default => 0.0
    t.integer  "potassium",        :default => 0
    t.integer  "sodium",           :default => 0
    t.float    "vitamin_c",        :default => 0.0
    t.integer  "vitamin_a",        :default => 0
    t.integer  "vitamin_e",        :default => 0
    t.float    "saturated_fat",    :default => 0.0
    t.integer  "cholesterol",      :default => 0
    t.float    "common_weight_1",  :default => 0.0
    t.string   "common_serving_1", :default => "0"
    t.float    "common_weight_2",  :default => 0.0
    t.string   "common_serving_2", :default => "0"
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
  end

  create_table "users", :force => true do |t|
    t.string   "username",        :null => false
    t.string   "email",           :null => false
    t.string   "password_digest", :null => false
    t.string   "gender",          :null => false
    t.string   "session_token",   :null => false
    t.text     "about_me"
    t.text     "my_inspiration"
    t.integer  "current_wt",      :null => false
    t.integer  "goal_wt",         :null => false
    t.integer  "height",          :null => false
    t.integer  "activity_level",  :null => false
    t.date     "birthday",        :null => false
    t.datetime "created_at",      :null => false
    t.datetime "updated_at",      :null => false
  end

end
