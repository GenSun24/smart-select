# app/models/country.rb
class Country < ApplicationRecord
  # Associations
  has_many :production_countries
  has_many :movies, through: :production_countries

  # Validations
  validates :country_iso_code, presence: true
  validates :country_name, presence: true
end

