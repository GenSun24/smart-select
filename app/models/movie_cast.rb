# app/models/movie_cast.rb
class MovieCast < ApplicationRecord
  belongs_to :movie
  belongs_to :person
  belongs_to :gender

  # Validation to ensure required fields are present
  validates :movie_id, presence: true
  validates :person_id, presence: true
  validates :character_name, presence: true
  validates :gender_id, presence: true
  validates :cast_order, presence: true

  # Additional validation to ensure cast order is unique per movie
  validates :cast_order, uniqueness: { scope: :movie_id, message: "should be unique per movie" }
end
