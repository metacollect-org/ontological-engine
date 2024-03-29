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

ActiveRecord::Schema.define(version: 20161203155920) do

  create_table "multilingual_languages", force: :cascade do |t|
    t.string "code", limit: 2, null: false
    t.index ["code"], name: "index_multilingual_languages_on_code"
  end

  create_table "multilingual_translation_types", force: :cascade do |t|
    t.string  "uid",   limit: 32, null: false
    t.integer "level",            null: false
    t.index ["uid"], name: "index_multilingual_translation_types_on_uid"
  end

  create_table "multilingual_translations", force: :cascade do |t|
    t.string  "content",           null: false
    t.integer "language_id",       null: false
    t.string  "translatable_type", null: false
    t.integer "translatable_id",   null: false
    t.integer "type_id"
    t.index ["translatable_type", "translatable_id"], name: "index_multilingual_translations_translatable"
  end

  create_table "ontological_categories", force: :cascade do |t|
    t.string "uri", null: false
    t.index ["uri"], name: "index_ontological_categories_on_uri"
  end

  create_table "ontological_relationships", force: :cascade do |t|
    t.integer "subject_id",   null: false
    t.integer "predicate_id", null: false
    t.integer "object_id",    null: false
  end

end
