class RenameTrucksIdOnRoutes < ActiveRecord::Migration[6.0]
  def change
    rename_column :routes, :trucks_id, :truck_id
  end
end
