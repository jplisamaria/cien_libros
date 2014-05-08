class AddNullFalseToTables < ActiveRecord::Migration
  def change
    change_column :parent_profiles, :first_name, :string, null: false, default: ''
    change_column :parent_profiles, :last_name, :string, null: false, default: ''
    change_column :student_profiles, :first_name, :string, null: false, default: ''
    change_column :student_profiles, :last_name, :string, null: false, default: ''
    change_column :student_profiles, :at_hernandez, :boolean, null: false, default: false
  end
end
