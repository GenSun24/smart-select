# app/models/country.rb
class Keyword < ApplicationRecord
  # Associations
  has_many :movie_keywords
  has_many :movies, through: :movie_keywords

  # Validations
  validates :keyword_name, presence: true
end
