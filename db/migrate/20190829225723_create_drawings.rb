class CreateDrawings < ActiveRecord::Migration[5.2]
  def change
    create_table :drawings do |t|
      t.string :email
      t.string :name
      t.integer :count
      t.integer :giveawayid

      t.timestamps
    end
  end
end
