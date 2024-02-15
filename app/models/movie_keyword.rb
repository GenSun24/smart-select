# app/models/movie_keyword.rb
class MovieKeyword < ApplicationRecord
  belongs_to :movie
  belongs_to :keyword

  # Validations
  validates :movie_id, presence: true
  validates :keyword_id, presence: true
end
