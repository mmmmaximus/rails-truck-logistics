class CreateModelTypes < ActiveRecord::Migration[6.0]
  def change
    create_table :model_types do |t|
      t.string :name, null: false
      t.string :brand, null: false
      t.references :trucks
    end
  end
end

