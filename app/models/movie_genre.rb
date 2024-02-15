# app/models/production_country.rb
class MovieGenre < ApplicationRecord
  belongs_to :movie
  belongs_to :genre

  # Validations
  validates :movie_id, presence: true
  validates :genre_id, presence: true
end
