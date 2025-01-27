# frozen_string_literal: true

# Controller for home page
class HomeController < ApplicationController
  def index
    columns_to_check = %w[ph orp uv_vis]

    # Create a condition for each column checking if it's NULL
    conditions = columns_to_check.map { |col| col.include?(' ') ? "\"#{col}\" IS NULL" : "#{col} IS NULL" }.join(' OR ')

    # Execute the query
    @water_quality_tests = WaterQualityTest.where(conditions).order(:id)
  end
end
