class ChangeColumnName < ActiveRecord::Migration[5.2]
  def change
    rename_column :rvparks, :parkName, :parkname
    add_column :rvparks, :email, :string
  end
end
