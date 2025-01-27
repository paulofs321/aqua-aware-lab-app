# frozen_string_literal: true

# Model class for concentrations
class Concentration < ApplicationRecord
  # Associations
  belongs_to :sample
  belongs_to :chemical

  # Validations
  validates :concentration, presence: true
end
