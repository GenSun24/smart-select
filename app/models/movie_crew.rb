# app/models/movie_crew.rb
class MovieCrew < ApplicationRecord
  belongs_to :movie
  belongs_to :department

  # Validations
  validates :movie_id, presence: true
  validates :person_id, presence: true
  validates :department_id, presence: true
  validates :job, presence: true
end
