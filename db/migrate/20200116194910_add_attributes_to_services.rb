class AddAttributesToServices < ActiveRecord::Migration[5.2]
  def change
    add_column :services, :category, :string
    add_column :services, :name, :string
    add_column :services, :description, :string
    add_column :services, :price_hourly, :integer
    add_column :services, :price_daily, :integer
  end
end
