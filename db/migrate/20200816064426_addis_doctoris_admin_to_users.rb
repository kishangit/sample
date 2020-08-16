class AddisDoctorisAdminToUsers < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :is_doctor, :boolean, default: false
  	add_column :users, :is_admin, :boolean, default: false
  	add_column :users, :username, :string
  end
end
