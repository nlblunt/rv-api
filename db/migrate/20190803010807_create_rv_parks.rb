class CreateRvParks < ActiveRecord::Migration[5.2]
  def change
    create_table :rvparks do |t|
      t.string :parkName
      t.boolean :private, :default => false
      t.boolean :public, :default => true
      t.string :membership
      t.float :lat
      t.float :lng
      t.string :icon
      t.string :googleId
      t.string :phoneNumber
      t.float :rating
      t.string :address
      t.integer :zip
      t.string :website
      t.string :reservation
      t.float :price
      t.text :description

      t.boolean :pets, :default => false
      t.boolean :laundry, :default => false
      t.boolean :bigrigs, :default => false
      t.boolean :paved, :default => false
      t.boolean :dirt, :default => false
      t.boolean :gravel, :default => false
      t.boolean :dumpstation, :default => false
      t.boolean :tents, :default => false
      t.boolean :store, :default => false
      t.boolean :wifi, :default => false
      t.boolean :cell, :default => false
      t.boolean :cabletv, :default => false
      t.boolean :firepits, :default => false
      t.boolean :bbqs, :default => false
      t.boolean :picnictables, :default => false
      t.boolean :playground, :default => false
      t.boolean :communityarea, :default => false
      
      t.boolean :visa, :default => false
      t.boolean :mastercard, :default => false
      t.boolean :check, :default => false

      t.boolean :verified, :default => false
      t.timestamps
    end
  end
end
