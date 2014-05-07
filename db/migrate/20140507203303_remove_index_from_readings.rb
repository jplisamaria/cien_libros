class RemoveIndexFromReadings < ActiveRecord::Migration
  def change
    remove_index :readings, name: :index_readings_on_user_book_id
  end
end
