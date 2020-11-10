class CreateTrucks < ActiveRecord::Migration[6.0]
  def change
    create_table :trucks do |t|
      t.string :license_plate
      t.integer :capacity
      t.references :model_type
      t.string :color
      t.date :service_date
      t.integer :status
      t.references :drivers
      t.timestamps null: false
    end
  end
end
