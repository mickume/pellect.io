class BookmarkExpiration < ActiveRecord::Migration
  def change
    add_column :bookmarks, :time_to_expiration, :integer
    
    add_index(:bookmarks, :time_to_expiration)
  end
end
