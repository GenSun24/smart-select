# app/models/country.rb
class ProductionCompany < ApplicationRecord
  # Associations
  has_many :movie_companies
  has_many :movies, through: :movie_companies

  # Validations
  validates :company_name, presence: true
end
