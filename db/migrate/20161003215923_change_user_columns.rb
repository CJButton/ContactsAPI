



class ChangeUserColumns < ActiveRecord::Migration
  def change

    remove_column :users, :name
    remove_column :users, :email
    add_column :users, :username, :string, unique: true
    change_column :users, :username, :string, unique: true, null: false

  end
end
