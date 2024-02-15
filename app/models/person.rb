# app/models/person.rb
class Person < ApplicationRecord
  has_many :movie_casts
  has_many :movies_as_cast, through: :movie_casts, source: :movie

  has_many :movie_crews
  has_many :movies_as_crew, through: :movie_crews, source: :movie

  # Validation to ensure presence of person_name
  validates :person_name, presence: true
end
