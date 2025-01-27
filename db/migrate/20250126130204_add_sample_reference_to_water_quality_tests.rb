class AddSampleReferenceToWaterQualityTests < ActiveRecord::Migration[8.0]
  def change
    remove_column :water_quality_tests, :sample_id, :bigint, if_exists: true

    add_reference :water_quality_tests, :sample, null: false, foreign_key: { to_table: :samples }
    add_timestamps :water_quality_tests, default: -> { 'CURRENT_TIMESTAMP' }, null: false # Adds created_at and updated_at
  end
end
