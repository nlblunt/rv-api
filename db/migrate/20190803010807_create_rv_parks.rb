class CreateRvParks < ActiveRecord::Migration[5.2]
  def change
    create_table :rv_parks do |t|
      t.string :parkName
      t.float :lat
      t.float :lng
      t.string :icon
      t.string :googleId
      t.string :phoneNumber
      t.float :rating
      t.string :address
      t.integer :zip
      t.string :website
      t.boolean :new, :default => true

      t.text :description
      t.boolean :pets, :default => false
      t.boolean :laundry, :default => false

      t.timestamps
    end
  end
end
