class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password_digest, presence: true, uniqueness: true

  has_many :user_books
  has_many :books, through: :user_books
  has_many :readings, through: :user_books

  def book_list
    self.books.pluck(:title)
  end
end
