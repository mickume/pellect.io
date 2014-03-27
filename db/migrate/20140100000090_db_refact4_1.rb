class DbRefact41 < ActiveRecord::Migration
  def change
    add_column :resources, :url, :string
    add_index :resources, :url
  end
end
