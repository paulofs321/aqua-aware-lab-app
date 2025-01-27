# frozen_string_literal: true

# Model class for chemicals
class Chemical < ApplicationRecord
  # Associations
  has_many :concentrations, dependent: :restrict_with_exception

  # Validations
  validates :name, presence: true
end
