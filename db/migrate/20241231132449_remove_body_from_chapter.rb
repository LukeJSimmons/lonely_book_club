class RemoveBodyFromChapter < ActiveRecord::Migration[8.0]
  def change
    remove_column :chapters, :body, :text
  end
end
