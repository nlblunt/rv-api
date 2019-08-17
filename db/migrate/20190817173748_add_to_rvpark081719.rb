class AddToRvpark081719 < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :noreservations, :boolean
  end
end
