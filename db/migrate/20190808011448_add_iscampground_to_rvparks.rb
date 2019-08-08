class AddIscampgroundToRvparks < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :isnotcampground, :boolean, :default => false
  end
end
