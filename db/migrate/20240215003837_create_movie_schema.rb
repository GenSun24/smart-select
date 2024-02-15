class CreateMovieSchema < ActiveRecord::Migration[7.0]
  def change
    create_table :countries do |t|
      t.string :country_iso_code, limit: 10
      t.string :country_name, limit: 200
      t.timestamps
    end

    create_table :genres do |t|
      t.string :genre_name, limit: 100
      t.timestamps
    end

    create_table :genders do |t|
      t.string :gender, limit: 20
      t.timestamps
    end

    create_table :production_companies do |t|
      t.string :company_name, limit: 200
      t.timestamps
    end

    create_table :people do |t|
      t.string :person_name, limit: 500
      t.timestamps
    end

    create_table :departments do |t|
      t.string :department_name, limit: 200
      t.timestamps
    end

    create_table :movies do |t|
      t.string :title, limit: 1000
      t.integer :budget
      t.string :homepage, limit: 1000
      t.string :overview, limit: 1000
      t.decimal :popularity, precision: 12, scale: 6
      t.date :release_date
      t.bigint :revenue
      t.integer :runtime
      t.string :movie_status, limit: 50
      t.string :tagline, limit: 1000
      t.decimal :vote_average, precision: 4, scale: 2
      t.integer :vote_count
      t.timestamps
    end

    create_table :movie_genres do |t|
      t.references :movie, foreign_key: true
      t.references :genre, foreign_key: true
      t.timestamps
    end

    create_table :production_countries do |t|
      t.references :movie, foreign_key: true
      t.references :country, foreign_key: true
      t.timestamps
    end

    create_table :movie_crews do |t|
      t.references :movie, foreign_key: true
      t.references :person, foreign_key: true
      t.references :department, foreign_key: true
      t.string :job, limit: 200
      t.timestamps
    end

    create_table :movie_casts do |t|
      t.references :movie, foreign_key: true
      t.references :person, foreign_key: true
      t.string :character_name, limit: 400
      t.references :gender, foreign_key: true
      t.integer :cast_order
      t.timestamps
    end

    create_table :keywords do |t|
      t.string :keyword_name, limit: 100
      t.timestamps
    end

    create_table :movie_keywords do |t|
      t.references :movie, foreign_key: true
      t.references :keyword, foreign_key: true
      t.timestamps
    end

    create_table :language_roles do |t|
      t.string :language_role, limit: 20
      t.timestamps
    end

    create_table :movie_companies do |t|
      t.references :movie, foreign_key: true
      t.references :production_company, foreign_key: true
      t.timestamps
    end

    create_table :languages do |t|
      t.string :language_code, limit: 10
      t.string :language_name, limit: 500
      t.timestamps
    end
  end
end
