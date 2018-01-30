class DbRefact42 < ActiveRecord::Migration[5.1]
  def change
    add_column :resources, :title, :string
  end
end
