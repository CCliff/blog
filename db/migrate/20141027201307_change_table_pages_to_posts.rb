class ChangeTablePagesToPosts < ActiveRecord::Migration
  def change
    rename_table :pages, :posts
  end
end
