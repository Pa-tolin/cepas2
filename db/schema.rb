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

ActiveRecord::Schema.define(version: 2021_04_29_020956) do

  create_table "enologist_magazines", force: :cascade do |t|
    t.boolean "editor", default: false
    t.boolean "writer", default: false
    t.boolean "reviewer", default: false
    t.integer "enologist_id", null: false
    t.integer "magazine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enologist_id"], name: "index_enologist_magazines_on_enologist_id"
    t.index ["magazine_id"], name: "index_enologist_magazines_on_magazine_id"
  end

  create_table "enologist_wines", force: :cascade do |t|
    t.integer "score"
    t.integer "enologist_id", null: false
    t.integer "wine_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["enologist_id"], name: "index_enologist_wines_on_enologist_id"
    t.index ["wine_id"], name: "index_enologist_wines_on_wine_id"
  end

  create_table "enologists", force: :cascade do |t|
    t.string "name"
    t.integer "age"
    t.string "nationality"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "magazines", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "strains", force: :cascade do |t|
    t.string "name", null: false
    t.boolean "available", default: true
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "users", force: :cascade do |t|
    t.string "email", default: "", null: false
    t.string "encrypted_password", default: "", null: false
    t.string "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.boolean "admin", default: false
    t.index ["email"], name: "index_users_on_email", unique: true
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true
  end

  create_table "wine_strains", force: :cascade do |t|
    t.integer "percentage"
    t.integer "wine_id", null: false
    t.integer "strain_id", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["strain_id"], name: "index_wine_strains_on_strain_id"
    t.index ["wine_id"], name: "index_wine_strains_on_wine_id"
  end

  create_table "wines", force: :cascade do |t|
    t.string "name", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "enologist_magazines", "enologists"
  add_foreign_key "enologist_magazines", "magazines"
  add_foreign_key "enologist_wines", "enologists"
  add_foreign_key "enologist_wines", "wines"
  add_foreign_key "wine_strains", "strains"
  add_foreign_key "wine_strains", "wines"
end
