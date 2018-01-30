class DbRefact41 < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :url, :string
    add_index :resources, :url
  end
end
