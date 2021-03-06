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

ActiveRecord::Schema.define(version: 2019_05_22_084647) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "music_histories", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "music_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["music_id"], name: "index_music_histories_on_music_id"
    t.index ["user_id"], name: "index_music_histories_on_user_id"
  end

  create_table "musics", force: :cascade do |t|
    t.string "title", null: false
    t.string "image_url"
    t.string "music_url"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["title"], name: "index_musics_on_title", unique: true
  end

  create_table "post_favorites", force: :cascade do |t|
    t.bigint "user_id"
    t.bigint "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["post_id"], name: "index_post_favorites_on_post_id"
    t.index ["user_id", "post_id"], name: "index_post_favorites_on_user_id_and_post_id", unique: true
    t.index ["user_id"], name: "index_post_favorites_on_user_id"
  end

  create_table "posts", force: :cascade do |t|
    t.bigint "user_id"
    t.text "content", null: false
    t.string "post_image"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_posts_on_user_id"
  end

  create_table "studies", force: :cascade do |t|
    t.bigint "user_id", null: false
    t.integer "set", null: false
    t.datetime "start_at", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["user_id"], name: "index_studies_on_user_id"
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
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "uid", default: "", null: false
    t.string "provider", default: "", null: false
    t.string "name", default: "", null: false
    t.string "image_url", default: "", null: false
    t.string "token"
    t.string "meta"
    t.text "description"
    t.boolean "admin", default: false
    t.text "avatar"
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
    t.index ["uid", "provider"], name: "index_users_on_uid_and_provider", unique: true
  end

  add_foreign_key "music_histories", "musics"
  add_foreign_key "music_histories", "users"
  add_foreign_key "post_favorites", "posts"
  add_foreign_key "post_favorites", "users"
  add_foreign_key "posts", "users"
  add_foreign_key "studies", "users"
end
