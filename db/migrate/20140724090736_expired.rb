class Expired < ActiveRecord::Migration
  def change
    add_column :bookmarks, :expired, :boolean
    
    add_index(:bookmarks, :expired)
  end
end
