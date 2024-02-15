# app/models/country.rb
class Genre < ApplicationRecord
  # Associations
  has_many :movie_casts
  has_many :movies, through: :movie_casts

  # Validations
  validates :gender, presence: true
end

