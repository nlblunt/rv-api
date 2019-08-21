class AddToRvpark01 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :cancellation, :boolean
	add_column :rvparks, :wildlife, :boolean
	add_column :rvparks, :extravehiclefee, :boolean
	add_column :rvparks, :elevation, :string
  end
end