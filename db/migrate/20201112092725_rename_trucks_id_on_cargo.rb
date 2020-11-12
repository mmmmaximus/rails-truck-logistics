class RenameTrucksIdOnCargo < ActiveRecord::Migration[6.0]
  def change
    rename_column :cargos, :trucks_id, :truck_id
  end
end
