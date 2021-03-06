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

ActiveRecord::Schema.define(version: 20170117021000) do

  create_table "key_results", force: :cascade do |t|
    t.string   "description"
    t.integer  "objective_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.index ["objective_id"], name: "index_key_results_on_objective_id"
  end

  create_table "objectives", force: :cascade do |t|
    t.string   "description"
    t.integer  "organization_id"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.integer  "objective_id"
    t.integer  "year"
    t.integer  "quarter"
    t.index ["objective_id"], name: "index_objectives_on_objective_id"
    t.index ["organization_id"], name: "index_objectives_on_organization_id"
    t.index ["quarter"], name: "index_objectives_on_quarter"
    t.index ["year"], name: "index_objectives_on_year"
  end

  create_table "organizations", force: :cascade do |t|
    t.string   "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "weekly_progresses", force: :cascade do |t|
    t.integer  "key_result_id"
    t.integer  "year"
    t.integer  "week"
    t.integer  "progress"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
    t.index ["key_result_id"], name: "index_weekly_progresses_on_key_result_id"
  end

end
