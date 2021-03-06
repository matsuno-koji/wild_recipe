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

ActiveRecord::Schema.define(version: 20200311054757) do

  create_table "active_admin_comments", force: :cascade do |t|
    t.string "namespace"
    t.text "body"
    t.string "resource_type"
    t.integer "resource_id"
    t.string "author_type"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_type", "author_id"], name: "index_active_admin_comments_on_author_type_and_author_id"
    t.index ["namespace"], name: "index_active_admin_comments_on_namespace"
    t.index ["resource_type", "resource_id"], name: "index_active_admin_comments_on_resource_type_and_resource_id"
  end

  create_table "books", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_books_on_recipe_id"
    t.index ["user_id", "recipe_id"], name: "index_books_on_user_id_and_recipe_id", unique: true
    t.index ["user_id"], name: "index_books_on_user_id"
  end

  create_table "impressions", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_impressions_on_recipe_id"
    t.index ["user_id"], name: "index_impressions_on_user_id"
  end

  create_table "ingredients", force: :cascade do |t|
    t.string "name"
    t.string "amount"
    t.integer "number"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_ingredients_on_recipe_id"
  end

  create_table "likes", force: :cascade do |t|
    t.integer "user_id"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_likes_on_recipe_id"
    t.index ["user_id", "recipe_id"], name: "index_likes_on_user_id_and_recipe_id", unique: true
    t.index ["user_id"], name: "index_likes_on_user_id"
  end

  create_table "procedures", force: :cascade do |t|
    t.integer "number"
    t.text "content"
    t.integer "recipe_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["recipe_id"], name: "index_procedures_on_recipe_id"
  end

  create_table "recipes", force: :cascade do |t|
    t.string "name"
    t.integer "user_id"
    t.text "comment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.boolean "release", default: false
    t.string "image"
    t.index ["user_id"], name: "index_recipes_on_user_id"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "password_digest"
    t.boolean "admin", default: false
    t.string "remember_digest"
    t.text "profile_text"
    t.string "image"
    t.string "uid"
    t.string "provider"
    t.string "nickname"
    t.string "location"
    t.index ["email"], name: "index_users_on_email", unique: true
  end

end
