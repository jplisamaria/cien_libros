class CreateStudentProfiles < ActiveRecord::Migration
  def change
    create_table :student_profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :grade_last_year

      t.timestamps
    end
  end
end
