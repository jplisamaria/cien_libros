class Reading < ActiveRecord::Base
  belongs_to :user_book
  has_one :book, through: :user_book

  attr_accessor :title
end

