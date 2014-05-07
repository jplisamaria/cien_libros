class RenameUserBooks < ActiveRecord::Migration
  def change
    rename_table :user_books, :student_books
  end
end
