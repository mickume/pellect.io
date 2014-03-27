class DbRefact3 < ActiveRecord::Migration
  def change
      add_index :bookmarks, :site_id
      add_index :bookmarks, :resource_id
      add_index :sites, :host
  end
end
