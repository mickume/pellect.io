class DbRefact43 < ActiveRecord::Migration[5.1]
  def change
    change_table :bookmarks do |t|
      t.remove :url, :title
    end
    
    change_table :resources do |t|
      t.remove :host, :favicon
    end
  end
end
