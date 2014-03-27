class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :host
      t.string :favicon

      t.timestamps
    end
  end
  
  add_column :bookmarks, :site_id, :integer  # foreign key to sites
  add_column :resources, :site_id, :integer  # foreign key to sites
  
end
