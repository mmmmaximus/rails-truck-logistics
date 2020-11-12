class CreateJoinTableForTrucksAndDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :driver_trucks do |t|
      t.references :truck, foreign_key: true
      t.references :driver, foreign_key: true
    end
  end
end
