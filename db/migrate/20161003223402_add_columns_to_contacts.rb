



class AddColumnsToContacts < ActiveRecord::Migration
  def change

    add_column :contacts, :name, :string
    change_column :contacts, :name, :string, null: false

    add_column :contacts, :email, :string
    change_column :contacts, :email, :string, null: false
    
    add_column :contacts, :user_id, :integer
    change_column :contacts, :user_id, :integer, null: false

  end
end
