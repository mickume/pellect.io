class BookmarkExpiration < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :time_to_expiration, :integer
    
    add_index(:bookmarks, :time_to_expiration)
  end
end
