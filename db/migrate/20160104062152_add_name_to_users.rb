class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :image, :string
    add_column :users, :telephone, :string
  end
end
