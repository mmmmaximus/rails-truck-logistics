class CreateDrivers < ActiveRecord::Migration[6.0]
  def change
    create_table :drivers do |t|
      t.string :name
      t.string :license_number
      t.string :mobile_number
      t.string :email_address
      t.integer :age
      t.text :notes
      t.boolean :status
      t.references :trucks
      t.references :routes
      t.timestamps null: false
    end
  end
end
