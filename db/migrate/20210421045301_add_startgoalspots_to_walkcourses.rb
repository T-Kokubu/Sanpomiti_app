class AddStartgoalspotsToWalkcourses < ActiveRecord::Migration[5.2]
  def change
    add_column :walkcourses, :start_station, :string, default: nil
    add_column :walkcourses, :time_to_first_spot, :integer, default: nil
    add_column :walkcourses, :goal_station, :string, default: nil
  end
end
