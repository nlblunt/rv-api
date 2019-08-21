class AddToRvpark01 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :requested, :boolean
  end
end