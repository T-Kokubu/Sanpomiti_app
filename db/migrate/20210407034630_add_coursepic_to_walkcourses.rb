class AddCoursepicToWalkcourses < ActiveRecord::Migration[5.2]
  def change
    add_column :walkcourses, :coursepic, :string
  end
end
