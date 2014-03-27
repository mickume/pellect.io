class CreateResources < ActiveRecord::Migration
  def change
    create_table :resources do |t|
      t.string :host
      t.string :favicon

      t.timestamps
    end
    
    add_column :bookmarks, :resource_id, :integer  # foreign key to the resources record
    add_index :resources, :host
    
  end
end
