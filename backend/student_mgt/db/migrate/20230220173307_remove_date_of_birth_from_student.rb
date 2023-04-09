class RemoveDateOfBirthFromStudent < ActiveRecord::Migration[7.0]
  def change
    remove_column :students, :date_of_birth
  end
end
