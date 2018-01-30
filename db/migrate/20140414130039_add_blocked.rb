class AddBlocked < ActiveRecord::Migration[5.1]
  def change
    add_column :users, :blocked, :boolean
  end
end
