class AddStartgoalspotsToWalkcourses < ActiveRecord::Migration[5.2]
  def change
    add_column :walkcourses, :start_station, :string
    add_column :walkcourses, :time_to_first_spot, :integer
    add_column :walkcourses, :goal_station, :string
  end
end
