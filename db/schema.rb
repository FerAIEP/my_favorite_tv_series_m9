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

ActiveRecord::Schema.define(version: 2022_06_04_002548) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "active_storage_attachments", force: :cascade do |t|
    t.string "name", null: false
    t.string "record_type", null: false
    t.bigint "record_id", null: false
    t.bigint "blob_id", null: false
    t.datetime "created_at", null: false
    t.index ["blob_id"], name: "index_active_storage_attachments_on_blob_id"
    t.index ["record_type", "record_id", "name", "blob_id"], name: "index_active_storage_attachments_uniqueness", unique: true
  end

  create_table "active_storage_blobs", force: :cascade do |t|
    t.string "key", null: false
    t.string "filename", null: false
    t.string "content_type"
    t.text "metadata"
    t.string "service_name", null: false
    t.bigint "byte_size", null: false
    t.string "checksum", null: false
    t.datetime "created_at", null: false
    t.index ["key"], name: "index_active_storage_blobs_on_key", unique: true
  end

  create_table "active_storage_variant_records", force: :cascade do |t|
    t.bigint "blob_id", null: false
    t.string "variation_digest", null: false
    t.index ["blob_id", "variation_digest"], name: "index_active_storage_variant_records_uniqueness", unique: true
  end

  create_table "actors", force: :cascade do |t|
    t.string "first_name"
    t.string "last_name"
    t.integer "age"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "actors_tv_shows", id: false, force: :cascade do |t|
    t.bigint "actor_id"
    t.bigint "tv_show_id"
    t.index ["actor_id"], name: "index_actors_tv_shows_on_actor_id"
    t.index ["tv_show_id"], name: "index_actors_tv_shows_on_tv_show_id"
  end

  create_table "episodes", force: :cascade do |t|
    t.integer "episode_number"
    t.string "title"
    t.text "summary"
    t.bigint "tv_show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tv_show_id"], name: "index_episodes_on_tv_show_id"
  end

  create_table "film_locations", force: :cascade do |t|
    t.string "name"
    t.boolean "indoor"
    t.bigint "tv_show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["tv_show_id"], name: "index_film_locations_on_tv_show_id"
  end

  create_table "genre_tv_shows", force: :cascade do |t|
    t.bigint "genre_id", null: false
    t.bigint "tv_show_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["genre_id"], name: "index_genre_tv_shows_on_genre_id"
    t.index ["tv_show_id"], name: "index_genre_tv_shows_on_tv_show_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "nationalities", force: :cascade do |t|
    t.string "name"
    t.text "description"
    t.string "flag_img"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "tv_shows", force: :cascade do |t|
    t.string "name", null: false
    t.text "summary"
    t.datetime "release_date"
    t.float "rating", default: 0.0
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.bigint "nationality_id", null: false
    t.bigint "user_id", null: false
    t.index ["nationality_id"], name: "index_tv_shows_on_nationality_id"
    t.index ["user_id"], name: "index_tv_shows_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.string "user_name"
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "active_storage_attachments", "active_storage_blobs", column: "blob_id"
  add_foreign_key "active_storage_variant_records", "active_storage_blobs", column: "blob_id"
  add_foreign_key "episodes", "tv_shows"
  add_foreign_key "film_locations", "tv_shows"
  add_foreign_key "genre_tv_shows", "genres"
  add_foreign_key "genre_tv_shows", "tv_shows"
  add_foreign_key "tv_shows", "nationalities"
  add_foreign_key "tv_shows", "users"
end
