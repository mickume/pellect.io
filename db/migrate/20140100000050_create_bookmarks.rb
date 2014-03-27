class CreateBookmarks < ActiveRecord::Migration
  def change
    create_table :bookmarks do |t|
      t.belongs_to :user
      
      t.string :url
      t.string :url_shortened
      t.string :description
      t.integer :view_count  
      
      t.timestamps
    end
  end
end
