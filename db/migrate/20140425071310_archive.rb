class Archive < ActiveRecord::Migration[5.1]
  def change
    add_column :bookmarks, :archived, :boolean
    
    add_index(:bookmarks, :archived)
  end
end
