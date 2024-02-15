# app/models/country.rb
class Language < ApplicationRecord
  # Associations
  has_many :movie_languages
  has_many :movies, through: :movie_languages

  # Validations
  validates :language_code, presence: true
  validates :language_name, presence: true
end

