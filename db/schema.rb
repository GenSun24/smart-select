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

ActiveRecord::Schema[7.0].define(version: 2024_02_15_003837) do
  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "countries", force: :cascade do |t|
    t.string "country_iso_code", limit: 10
    t.string "country_name", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "departments", force: :cascade do |t|
    t.string "department_name", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genders", force: :cascade do |t|
    t.string "gender", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "genres", force: :cascade do |t|
    t.string "genre_name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "keywords", force: :cascade do |t|
    t.string "keyword_name", limit: 100
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "language_roles", force: :cascade do |t|
    t.string "language_role", limit: 20
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "languages", force: :cascade do |t|
    t.string "language_code", limit: 10
    t.string "language_name", limit: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "movie_casts", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "person_id"
    t.string "character_name", limit: 400
    t.bigint "gender_id"
    t.integer "cast_order"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["gender_id"], name: "index_movie_casts_on_gender_id"
    t.index ["movie_id"], name: "index_movie_casts_on_movie_id"
    t.index ["person_id"], name: "index_movie_casts_on_person_id"
  end

  create_table "movie_companies", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "production_company_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["movie_id"], name: "index_movie_companies_on_movie_id"
    t.index ["production_company_id"], name: "index_movie_companies_on_production_company_id"
  end

  create_table "movie_crews", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "person_id"
    t.bigint "department_id"
    t.string "job", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["department_id"], name: "index_movie_crews_on_department_id"
    t.index ["movie_id"], name: "index_movie_crews_on_movie_id"
    t.index ["person_id"], name: "index_movie_crews_on_person_id"
  end

  create_table "movie_genres", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "genre_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["genre_id"], name: "index_movie_genres_on_genre_id"
    t.index ["movie_id"], name: "index_movie_genres_on_movie_id"
  end

  create_table "movie_keywords", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "keyword_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["keyword_id"], name: "index_movie_keywords_on_keyword_id"
    t.index ["movie_id"], name: "index_movie_keywords_on_movie_id"
  end

  create_table "movies", force: :cascade do |t|
    t.string "title", limit: 1000
    t.integer "budget"
    t.string "homepage", limit: 1000
    t.string "overview", limit: 1000
    t.decimal "popularity", precision: 12, scale: 6
    t.date "release_date"
    t.bigint "revenue"
    t.integer "runtime"
    t.string "movie_status", limit: 50
    t.string "tagline", limit: 1000
    t.decimal "vote_average", precision: 4, scale: 2
    t.integer "vote_count"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "people", force: :cascade do |t|
    t.string "person_name", limit: 500
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_companies", force: :cascade do |t|
    t.string "company_name", limit: 200
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "production_countries", force: :cascade do |t|
    t.bigint "movie_id"
    t.bigint "country_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["country_id"], name: "index_production_countries_on_country_id"
    t.index ["movie_id"], name: "index_production_countries_on_movie_id"
  end

  add_foreign_key "movie_casts", "genders"
  add_foreign_key "movie_casts", "movies"
  add_foreign_key "movie_casts", "people"
  add_foreign_key "movie_companies", "movies"
  add_foreign_key "movie_companies", "production_companies"
  add_foreign_key "movie_crews", "departments"
  add_foreign_key "movie_crews", "movies"
  add_foreign_key "movie_crews", "people"
  add_foreign_key "movie_genres", "genres"
  add_foreign_key "movie_genres", "movies"
  add_foreign_key "movie_keywords", "keywords"
  add_foreign_key "movie_keywords", "movies"
  add_foreign_key "production_countries", "countries"
  add_foreign_key "production_countries", "movies"
end
