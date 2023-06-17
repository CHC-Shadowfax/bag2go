class AddAttributesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :mobile_phone, :string
    add_column :users, :user_type, :string
    add_column :users, :address, :text
  end
end
