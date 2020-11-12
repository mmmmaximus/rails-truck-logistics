class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name, null: false
      t.string :license_number, null: false
      t.string :mobile_number, null: false
      t.string :email_address, null: false
      t.integer :age, null: false
      t.text :notes
      t.boolean :status, null: false
      t.references :trucks
      t.references :routes
      t.timestamps null: false
    end
  end
end
