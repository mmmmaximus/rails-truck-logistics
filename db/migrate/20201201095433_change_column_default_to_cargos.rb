class ChangeColumnDefaultToCargos < ActiveRecord::Migration[6.0]
  def change
    change_column_default(:cargos, :paid, false)
  end
end
