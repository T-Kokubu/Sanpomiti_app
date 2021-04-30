class AddSpotpicToSpots < ActiveRecord::Migration[5.2]
  def change
    add_column :spots, :spotpic, :string
  end
end
