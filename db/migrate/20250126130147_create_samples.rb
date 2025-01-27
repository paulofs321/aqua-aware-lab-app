class CreateSamples < ActiveRecord::Migration[8.0]
  def change
    create_table :samples do |t|
      t.string :description
      t.timestamps # Adds created_at and updated_at timestamps
    end
  end
end
