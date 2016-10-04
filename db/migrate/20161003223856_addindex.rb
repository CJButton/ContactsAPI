class Addindex < ActiveRecord::Migration
  def change
    add_index(:contacts, :user_id)

    add_column :contacts, :created_at, :datetime
    add_column :contacts, :updated_at, :datetime
  end
end
