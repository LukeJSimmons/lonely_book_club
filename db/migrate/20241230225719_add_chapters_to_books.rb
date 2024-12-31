class AddChaptersToBooks < ActiveRecord::Migration[8.0]
  def change
    add_column :books, :chapters, :integer
  end
end
