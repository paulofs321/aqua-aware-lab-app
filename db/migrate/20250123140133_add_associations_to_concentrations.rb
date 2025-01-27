class AddAssociationsToConcentrations < ActiveRecord::Migration[8.0]
  def change
    def change
      # Add sample_id as a foreign key referencing water_quality_tests
      add_reference :concentrations, :water_quality_test, foreign_key: { to_table: :water_quality_tests }, column: :sample_id

      # Add chemical_id as a foreign key referencing chemicals (if you want this too)
      add_reference :concentrations, :chemical, foreign_key: true
    end
  end
end
