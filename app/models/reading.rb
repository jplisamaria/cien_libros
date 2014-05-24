class Reading < ActiveRecord::Base
  belongs_to :student_book
  has_one :book, through: :student_books

  attr_accessor :title

  def book_title
    student_book.book.title
  end

  def self.newest_first
    order(created_at: :desc)
  end
end
