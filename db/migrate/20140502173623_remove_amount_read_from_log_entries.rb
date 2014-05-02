class RemoveAmountReadFromLogEntries < ActiveRecord::Migration
  def change
    remove_column :log_entries, :amount_read, :string
  end
end
