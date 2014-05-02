class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :author }

  has_many :user_books
  has_many :users, through: :user_books
end
