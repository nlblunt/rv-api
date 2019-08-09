class AddToRvparks < ActiveRecord::Migration[5.2]
  def change
    add_column :rvparks, :cabins, :boolean, :default => false
    add_column :rvparks, :fullhookup, :boolean, :default => false
    add_column :rvparks, :electriconly, :boolean, :default => false
    add_column :rvparks, :wateronly, :boolean, :default => false
    add_column :rvparks, :paidshowers, :boolean, :default => false
    add_column :rvparks, :foodlockers, :boolean, :default => false

    rename_column :rvparks, :pets, :nopets
  end
end
