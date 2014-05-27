class RenameColumnInTeacherStudentRelationships < ActiveRecord::Migration
  def change
    rename_column :teacher_student_relationships, :TeacherProfile_id, :teacher_profile_id
    rename_column :teacher_student_relationships, :StudentProfile_id, :student_profile_id
  end
end
