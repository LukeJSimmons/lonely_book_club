class RenameChaptersToTotalChapters < ActiveRecord::Migration[8.0]
  def change
    rename_column :books, :chapters, :total_chapters
  end
end
