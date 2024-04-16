class RemoveColumns < ActiveRecord::Migration[7.1]
  def up
    remove_column :movies, :thumbnail_url
    remove_column :users, :name
  end

  def down
    add_column :movies, :thumbnail_url, :string
    add_column :users, :name, :string
  end
end
