# frozen_string_literal: true

# Model class for WaterQualityTest
class WaterQualityTest < ApplicationRecord
  # Associations
  belongs_to :sample

  # Validations
  validates :ph, presence: true, allow_nil: true
  validates :orp, presence: true, allow_nil: true
  validates :uv_vis, presence: true, allow_nil: true
end
