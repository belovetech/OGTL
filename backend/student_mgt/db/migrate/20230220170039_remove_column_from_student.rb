class RemoveColumnFromStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :age
  end
end
