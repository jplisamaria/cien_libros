class AddColumnsToStudentProfiles < ActiveRecord::Migration
  def change
    add_reference :student_profiles, :parent_profile, index: true
    add_column :student_profiles, :at_hernandez, :boolean
  end
end
