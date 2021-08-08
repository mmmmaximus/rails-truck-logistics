class AddTimestampsToRoutes < ActiveRecord::Migration[6.0]
  def change
    change_table :routes do |t|
      t.timestamps null: false
    end
  end
end
