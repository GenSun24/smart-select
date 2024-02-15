# app/models/department.rb
class Department < ApplicationRecord
  has_many :movie_crews

  # Validation
  validates :department_name, presence: true
end
