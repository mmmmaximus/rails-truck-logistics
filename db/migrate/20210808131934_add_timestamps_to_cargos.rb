class AddTimestampsToCargos < ActiveRecord::Migration[6.0]
  def change
    change_table :cargos do |t|
      t.timestamps null: false
    end
  end
end
