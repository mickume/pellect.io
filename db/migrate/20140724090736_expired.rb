class Expired < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :expired, :boolean
    
    add_index(:bookmarks, :expired)
  end
end
