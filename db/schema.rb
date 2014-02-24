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

ActiveRecord::Schema.define(:version => 20140224192731) do

  create_table "daily_entries", :force => true do |t|
    t.date     "entry_date"
    t.integer  "calories_consumed",   :default => 0,   :null => false
    t.integer  "calories_burned",     :default => 0,   :null => false
    t.float    "fat_intake",          :default => 0.0, :null => false
    t.float    "carbohydrate_intake", :default => 0.0, :null => false
    t.float    "protein_intake",      :default => 0.0, :null => false
    t.float    "calcium_intake",      :default => 0.0, :null => false
    t.float    "iron_intake",         :default => 0.0, :null => false
    t.float    "vitamin_a_intake",    :default => 0.0, :null => false
    t.float    "vitamin_c_intake",    :default => 0.0, :null => false
    t.integer  "diary_id"
    t.datetime "created_at",                           :null => false
    t.datetime "updated_at",                           :null => false
  end

  add_index "daily_entries", ["diary_id"], :name => "index_daily_entries_on_diary_id"
  add_index "daily_entries", ["entry_date"], :name => "index_daily_entries_on_entry_date"

  create_table "diaries", :force => true do |t|
    t.string   "meal0",      :default => "Breakfast"
    t.string   "meal1",      :default => "Lunch"
    t.string   "meal2",      :default => "Dinner"
    t.string   "meal3"
    t.string   "meal4"
    t.string   "meal5"
    t.integer  "user_id",                             :null => false
    t.datetime "created_at",                          :null => false
    t.datetime "updated_at",                          :null => false
  end

  add_index "diaries", ["user_id"], :name => "index_diaries_on_user_id"

  create_table "feed_items", :force => true do |t|
    t.string   "body"
    t.integer  "owner_id"
    t.string   "owner_type"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  create_table "foods", :force => true do |t|
    t.string   "name",                              :null => false
    t.integer  "usda_id",          :default => 0,   :null => false
    t.integer  "calories",                          :null => false
    t.float    "protein",                           :null => false
    t.float    "fat",                               :null => false
    t.float    "carbohydrates",                     :null => false
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

  create_table "friend_requests", :force => true do |t|
    t.integer  "user_id"
    t.integer  "friend_id"
    t.datetime "created_at", :null => false
    t.datetime "updated_at", :null => false
  end

  add_index "friend_requests", ["user_id"], :name => "index_friend_requests_on_user_id"

  create_table "friendships", :force => true do |t|
    t.integer  "user_id",                           :null => false
    t.integer  "friend_id",                         :null => false
    t.datetime "created_at",                        :null => false
    t.datetime "updated_at",                        :null => false
    t.string   "status",     :default => "PENDING", :null => false
  end

  add_index "friendships", ["friend_id"], :name => "index_friendships_on_friend_id"
  add_index "friendships", ["user_id"], :name => "index_friendships_on_user_id"

  create_table "goals", :force => true do |t|
    t.integer  "user_id",             :null => false
    t.integer  "bmr",                 :null => false
    t.integer  "calorie_goal",        :null => false
    t.integer  "fat_ratio",           :null => false
    t.integer  "carb_ratio",          :null => false
    t.integer  "protein_ratio",       :null => false
    t.integer  "sodium",              :null => false
    t.integer  "potassium",           :null => false
    t.integer  "cholesterol",         :null => false
    t.integer  "calcium",             :null => false
    t.integer  "vitamin_a",           :null => false
    t.integer  "vitamin_c",           :null => false
    t.integer  "iron",                :null => false
    t.integer  "workouts_per_week",   :null => false
    t.integer  "minutes_per_workout", :null => false
    t.integer  "weight_loss_rate",    :null => false
    t.datetime "created_at",          :null => false
    t.datetime "updated_at",          :null => false
  end

  add_index "goals", ["user_id"], :name => "index_goals_on_user_id"

  create_table "meal_entries", :force => true do |t|
    t.integer  "daily_entry_id"
    t.integer  "food_id"
    t.datetime "created_at",     :null => false
    t.datetime "updated_at",     :null => false
    t.integer  "meal_id",        :null => false
    t.float    "quantity",       :null => false
  end

  add_index "meal_entries", ["daily_entry_id"], :name => "index_meal_entries_on_daily_entry_id"
  add_index "meal_entries", ["meal_id"], :name => "index_meal_entries_on_meal_id"

  create_table "messages", :force => true do |t|
    t.integer  "recipient_id", :null => false
    t.integer  "sender_id",    :null => false
    t.string   "subject"
    t.text     "body"
    t.datetime "created_at",   :null => false
    t.datetime "updated_at",   :null => false
  end

  add_index "messages", ["recipient_id"], :name => "index_messages_on_recipient_id"
  add_index "messages", ["sender_id"], :name => "index_messages_on_sender_id"

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
    t.string   "city"
    t.string   "state"
    t.integer  "zipcode"
    t.integer  "age"
  end

end
