class StudentBook < ActiveRecord::Base
  belongs_to :student_profile, dependent: :destroy
  belongs_to :book, dependent: :destroy
  has_many :readings
end
