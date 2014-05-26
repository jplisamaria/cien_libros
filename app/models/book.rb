class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :author }

  has_many :student_books
  has_many :student_profiles, through: :student_books

  def has_author?
    self.author != ''
  end

  def has_no_author?
    self.author == ''
  end
end
