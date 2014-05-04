class CreateReadings < ActiveRecord::Migration
  def change
    create_table :readings do |t|
      t.belongs_to :user_book, index: true
      t.string :amount_read

      t.timestamps
    end
  end
end
