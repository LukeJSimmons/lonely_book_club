class RemoveGenreFromBooks < ActiveRecord::Migration[8.0]
  def change
    remove_column :books, :genre, :string
  end
end
