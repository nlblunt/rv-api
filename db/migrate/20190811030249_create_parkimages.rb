class CreateParkimages < ActiveRecord::Migration[5.2]
  def change
    create_table :parkimages do |t|
      t.integer :rvpark_id
      t.string :url
      t.references :rvpark, foreign_key: true
      t.timestamps
    end
  end
end
