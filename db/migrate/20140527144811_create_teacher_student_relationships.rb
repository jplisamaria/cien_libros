class CreateTeacherStudentRelationships < ActiveRecord::Migration
  def change
    create_table :teacher_student_relationships do |t|
      t.belongs_to :TeacherProfile, index: true
      t.belongs_to :StudentProfile, index: true

      t.timestamps
    end
  end
end
