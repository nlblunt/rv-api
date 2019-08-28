class CreateChambers < ActiveRecord::Migration[5.2]
  def change
    create_table :chambers do |t|
      t.string :chamberName
      t.string :address
      t.string :phone
      t.string :title
      t.string :shortdescription
      t.string :longdescription
      t.string :headerurl
      t.string :fullpageurl
      t.string :campgrounds
      t.string :diners
      t.string :attractions

      t.timestamps
    end
  end
end
