class AddToRvparks081319 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :propane, :boolean
    add_column :rvparks, :toiletvault, :boolean
    add_column :rvparks, :toiletflush, :boolean
    add_column :rvparks, :toiletouthouse, :boolean
    add_column :rvparks, :pullthru, :boolean
    add_column :rvparks, :backin, :boolean
    add_column :rvparks, :rvlength, :integer
    add_column :rvparks, :latitude, :float
    add_column :rvparks, :longitude, :float
  end
end
