class AddTitleAndIndexToChapter < ActiveRecord::Migration[8.0]
  def change
    add_column :chapters, :title, :string
    add_column :chapters, :index, :integer
  end
end
