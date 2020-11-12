class CreateRoutes < ActiveRecord::Migration[6.0]
  def change
    create_table :routes do |t|
      t.string :name, null: false
      t.integer :length_of_time, null: false
      t.references :trucks
    end
  end
end
