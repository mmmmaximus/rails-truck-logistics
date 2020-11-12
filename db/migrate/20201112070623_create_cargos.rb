class CreateCargos < ActiveRecord::Migration[6.0]
  def change
    create_table :cargos do |t|
      t.text :description, null: false
      t.string :title, null: false
      t.integer :reference_number, null: false
      t.decimal :value, null: false
      t.references :trucks
      t.boolean :paid
    end
  end
end
