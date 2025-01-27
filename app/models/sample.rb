# frozen_string_literal: true

# Model class for samples
class Sample < ApplicationRecord
  has_many :water_quality_tests, dependent: :destroy
  has_many :concentrations, dependent: :destroy

  validates :description, presence: true
end
