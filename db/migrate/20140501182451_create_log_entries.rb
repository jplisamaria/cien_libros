class CreateLogEntries < ActiveRecord::Migration
  def change
    create_table :log_entries do |t|
      t.belongs_to :book, index: true
      t.belongs_to :user, index: true
      t.string :amount_read

      t.timestamps
    end
  end
end
