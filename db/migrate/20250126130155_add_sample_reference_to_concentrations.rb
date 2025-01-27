class AddSampleReferenceToConcentrations < ActiveRecord::Migration[8.0]
  def change
    remove_column :concentrations, :sample_id, :bigint, if_exists: true

    add_reference :concentrations, :sample, null: false, foreign_key: { to_table: :samples }
    add_timestamps :concentrations, default: -> { 'CURRENT_TIMESTAMP' }, null: false # Adds created_at and updated_at
  end
end
