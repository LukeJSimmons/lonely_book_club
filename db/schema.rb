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

ActiveRecord::Schema[8.0].define(version: 2025_01_05_140537) do
  create_table "authors", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.text "bio"
  end

  create_table "books", force: :cascade do |t|
    t.string "title"
    t.integer "pages"
    t.integer "user_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "total_chapters"
    t.integer "genre_id"
    t.integer "author_id"
    t.index ["author_id"], name: "index_books_on_author_id"
    t.index ["genre_id"], name: "index_books_on_genre_id"
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "chapters", force: :cascade do |t|
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "title"
    t.integer "index"
    t.index ["book_id"], name: "index_chapters_on_book_id"
  end

  create_table "genres", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "notes", force: :cascade do |t|
    t.text "content"
    t.integer "chapter_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["chapter_id"], name: "index_notes_on_chapter_id"
  end

  create_table "reviews", force: :cascade do |t|
    t.integer "rating"
    t.text "body"
    t.integer "book_id", null: false
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["book_id"], name: "index_reviews_on_book_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  add_foreign_key "books", "authors"
  add_foreign_key "books", "genres"
  add_foreign_key "books", "users"
  add_foreign_key "chapters", "books"
  add_foreign_key "notes", "chapters"
  add_foreign_key "reviews", "books"
end
