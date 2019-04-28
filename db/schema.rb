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

ActiveRecord::Schema.define(version: 20190428052349) do

  create_table "brands", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "categories", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "name",       limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "comments", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "comment",    limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "delivery_dates", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "delivery_ways", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "images", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "image",      limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "items", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string  "name",                           null: false
    t.integer "price",                          null: false
    t.text    "info",             limit: 65535, null: false
    t.integer "user_id"
    t.integer "image_id"
    t.integer "comment_id"
    t.integer "category_id"
    t.integer "brand_id"
    t.integer "size_id"
    t.integer "sell_status_id"
    t.integer "delivery_way_id"
    t.integer "delivery_date_id"
    t.integer "prefecture_id"
    t.integer "price_id"
    t.index ["brand_id"], name: "index_items_on_brand_id", using: :btree
    t.index ["category_id"], name: "index_items_on_category_id", using: :btree
    t.index ["comment_id"], name: "index_items_on_comment_id", using: :btree
    t.index ["delivery_date_id"], name: "index_items_on_delivery_date_id", using: :btree
    t.index ["delivery_way_id"], name: "index_items_on_delivery_way_id", using: :btree
    t.index ["image_id"], name: "index_items_on_image_id", using: :btree
    t.index ["prefecture_id"], name: "index_items_on_prefecture_id", using: :btree
    t.index ["price_id"], name: "index_items_on_price_id", using: :btree
    t.index ["sell_status_id"], name: "index_items_on_sell_status_id", using: :btree
    t.index ["size_id"], name: "index_items_on_size_id", using: :btree
    t.index ["user_id"], name: "index_items_on_user_id", using: :btree
  end

  create_table "prefectures", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "prices", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "price"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "sell_statuses", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.text     "status",     limit: 65535
    t.datetime "created_at",               null: false
    t.datetime "updated_at",               null: false
  end

  create_table "sizes", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "size"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "nickname",                                          null: false
    t.string   "telephone",                                         null: false
    t.string   "email",                                default: "", null: false
    t.string   "encrypted_password",                   default: "", null: false
    t.integer  "birth_year",                                        null: false
    t.integer  "birth_month",                                       null: false
    t.integer  "birth_day",                                         null: false
    t.text     "icon_picture",           limit: 65535
    t.text     "profile",                limit: 65535
    t.text     "background_image",       limit: 65535
    t.integer  "point"
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.datetime "created_at",                                        null: false
    t.datetime "updated_at",                                        null: false
    t.string   "provider"
    t.string   "uid"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "items", "brands"
  add_foreign_key "items", "categories"
  add_foreign_key "items", "comments"
  add_foreign_key "items", "delivery_dates"
  add_foreign_key "items", "delivery_ways"
  add_foreign_key "items", "images"
  add_foreign_key "items", "prefectures"
  add_foreign_key "items", "prices"
  add_foreign_key "items", "sell_statuses"
  add_foreign_key "items", "sizes"
  add_foreign_key "items", "users"
end
