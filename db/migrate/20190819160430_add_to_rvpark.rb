class AddToRvpark < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :petarea, :boolean
    add_column :rvparks, :firewood, :boolean
    add_column :rvparks, :accessible, :boolean
    add_column :rvparks, :organizedactivity, :boolean
    add_column :rvparks, :seasonstart, :string
    add_column :rvparks, :seasonend, :string
  end
end
