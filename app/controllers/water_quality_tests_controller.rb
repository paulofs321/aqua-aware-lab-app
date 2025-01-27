# frozen_string_literal: true

# Controller for home page
class WaterQualityTestsController < ApplicationController
  # This before action will run the set_water_quality_test method before the actions listed
  before_action :set_water_quality_test, only: %i[show edit update]

  def show
    # Eager load concentrations and chemicals
    @sample = Sample.includes(concentrations: :chemical).find(sample_id)
    @concentrations = @sample.concentrations.includes(:chemical)
  end

  # Edit action - renders the form
  def edit
    @concentrations = @water_quality_test.sample.concentrations
  end

  # Update action - handles form submission
  def update
    @concentrations = @water_quality_test.sample.concentrations

    if water_quality_test_params.values.any?(&:blank?)
      # If any of the parameters are blank, show an alert and don't update
      puts 'HEREEEE'
      redirect_to @water_quality_test, alert: 'Some fields are missing. Please fill them in.'
    elsif @water_quality_test.update(water_quality_test_params)
      # Redirect to a success page or show the updated record
      redirect_to @water_quality_test, notice: 'Water quality test measurements were successfully updated.'
    else
      redirect_to @water_quality_test, alert: 'Failed to update the measurements. Make sure to input valid values.'
    end
  end

  private

  # This is the method that fetches the water_quality_test and makes it available in the views
  def set_water_quality_test
    @water_quality_test = WaterQualityTest.find(params[:id])
  end

  def sample_id
    @sample_id ||= @water_quality_test.sample_id
  end

  def water_quality_test_params
    params.require(:water_quality_test).permit(:ph, :orp, :uv_vis)
  end
end
