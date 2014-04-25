class Archive < ActiveRecord::Migration
  def change
    add_column :bookmarks, :archived, :boolean
    
    add_index(:bookmarks, :archived)
  end
end
