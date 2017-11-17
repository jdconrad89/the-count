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

ActiveRecord::Schema.define(version: 20171117200648) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "ingredients", force: :cascade do |t|
    t.string   "name"
    t.string   "brand"
    t.integer  "calories"
    t.integer  "fat"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "serving_size"
  end

  create_table "meal_ingredients", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "meal_id"
    t.index ["ingredient_id"], name: "index_meal_ingredients_on_ingredient_id", using: :btree
    t.index ["meal_id"], name: "index_meal_ingredients_on_meal_id", using: :btree
  end

  create_table "meals", force: :cascade do |t|
    t.integer "name",    default: 0
    t.date    "date"
    t.integer "user_id"
    t.index ["user_id"], name: "index_meals_on_user_id", using: :btree
  end

  create_table "recipe_ingredients", force: :cascade do |t|
    t.integer "ingredient_id"
    t.integer "recipe_id"
    t.index ["ingredient_id"], name: "index_recipe_ingredients_on_ingredient_id", using: :btree
    t.index ["recipe_id"], name: "index_recipe_ingredients_on_recipe_id", using: :btree
  end

  create_table "recipes", force: :cascade do |t|
    t.string   "name"
    t.string   "directions"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
    t.integer  "user_id"
    t.text     "description"
    t.index ["user_id"], name: "index_recipes_on_user_id", using: :btree
  end

  create_table "users", force: :cascade do |t|
    t.string   "name"
    t.string   "email"
    t.string   "password_digest"
    t.integer  "role",            default: 0
    t.datetime "created_at",                      null: false
    t.datetime "updated_at",                      null: false
    t.bigint   "uid"
    t.boolean  "social_login",    default: false
    t.text     "token"
    t.text     "avatar"
  end

  add_foreign_key "meal_ingredients", "ingredients"
  add_foreign_key "meal_ingredients", "meals"
  add_foreign_key "meals", "users"
  add_foreign_key "recipe_ingredients", "ingredients"
  add_foreign_key "recipe_ingredients", "recipes"
  add_foreign_key "recipes", "users"
end
