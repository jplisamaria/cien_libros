class StudentBook < ActiveRecord::Base
  belongs_to :student_profile
  belongs_to :book
  has_many :readings
end
