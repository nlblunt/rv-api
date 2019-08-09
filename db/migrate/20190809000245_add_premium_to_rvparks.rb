class AddPremiumToRvparks < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :premium, :boolean
  end
end
