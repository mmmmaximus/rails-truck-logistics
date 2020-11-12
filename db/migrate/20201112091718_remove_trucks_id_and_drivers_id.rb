class RemoveTrucksIdAndDriversId < ActiveRecord::Migration[6.0]
  def change
    remove_column :trucks, :drivers_id, :string
    remove_column :drivers, :trucks_id, :string
  end
end
