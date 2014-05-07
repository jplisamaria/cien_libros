class RenameUserIdInReadings < ActiveRecord::Migration
  def change
    rename_column :readings, :user_book_id, :student_book_id
    add_index :readings, :student_book_id
  end
end
