class AddDefaultValueToDrivers < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:drivers, :status, false)
  end
end
