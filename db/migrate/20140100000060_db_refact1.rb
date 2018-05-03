class DbRefact1 < ActiveRecord::Migration[5.1]
  def change
    
    # add new columns
    add_column :bookmarks, :url_shortened_pub, :string # public shortened url, used in cross-posts
    add_column :bookmarks, :title, :string  # the <title></title> of the page
    
    # some indicies
    # add_index :bookmarks, :user_id
    add_index :bookmarks, :url
    add_index :bookmarks, :url_shortened
    add_index :bookmarks, :url_shortened_pub
    add_index :bookmarks, :view_count
    add_index :bookmarks, :created_at
    add_index :bookmarks, :updated_at
    
  end
  
end
