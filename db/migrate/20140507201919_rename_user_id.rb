class RenameUserId < ActiveRecord::Migration
  def change
    rename_column :student_books, :user_id, :student_profile_id
  end
end
