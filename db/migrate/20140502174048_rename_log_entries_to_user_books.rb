class RenameLogEntriesToUserBooks < ActiveRecord::Migration
  def change
    rename_table :log_entries, :user_books
  end
end
