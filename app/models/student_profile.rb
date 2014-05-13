class StudentProfile < ActiveRecord::Base
  has_one :user, as: :profile, dependent: :destroy

  has_many :student_books
  has_many :books, through: :student_books
  has_many :readings, through: :student_books

  GOAL = 100
  GRADES = [
    'pre-school',
    'k1',
    'k2',
    '1st',
    '2nd',
    '3rd',
    '4th',
    '5th',
    '6th',
    '7th',
    '8th',
    'high school']

  def goal_reached?
    readings.count >= GOAL
  end

  def readings_left
    GOAL - readings_done
  end

  def readings_done
    readings.count
  end

  def book_list
    books.order(:title).pluck(:title)
  end

  def child_of(profile)
    parent_profile_id == profile.id
  end
end
