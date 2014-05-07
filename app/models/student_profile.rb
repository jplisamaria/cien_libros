class StudentProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  has_many :student_books
  has_many :books, through: :student_books
  has_many :readings, through: :student_books

  GRADES = %w(k1 k2 1st 2nd 3rd 4th 5th 6th 7th 8th)

  def book_list
    books.pluck(:title)
  end
end
