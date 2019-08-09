class AddPremiumUntil < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :premiumuntil, :date
  end
end
