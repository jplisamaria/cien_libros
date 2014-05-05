class Reading < ActiveRecord::Base
  belongs_to :user_book
  has_one :book, through: :user_book

  attr_accessor :title

  def book_title
    user_book.book.title
  end

  def self.newest_first
    self.order(created_at: :desc)
  end
end
