class AddTimestampsToModelTypes < ActiveRecord::Migration[6.0]
  def change
    change_table :model_types do |t|
      t.timestamps null: false
    end
  end
end
