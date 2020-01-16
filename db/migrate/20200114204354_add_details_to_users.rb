class AddDetailsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :sexe, :string
    add_column :users, :age, :integer
    add_column :users, :photo, :string
    add_column :users, :description, :text
    add_column :users, :height, :integer
    add_column :users, :alcool, :string
    add_column :users, :tabac, :string
    add_column :users, :address, :string
  end
end
