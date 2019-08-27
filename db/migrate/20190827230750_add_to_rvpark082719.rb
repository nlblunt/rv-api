class AddToRvpark082719 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :tentprice, :string
    add_column :rvparks, :rvprice, :string
  end
end
