class DbRefact43 < ActiveRecord::Migration
  def change
    change_table :bookmarks do |t|
      t.remove :url, :title
    end
    
    change_table :resources do |t|
      t.remove :host, :favicon
    end
  end
end
