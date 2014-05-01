class Book < ActiveRecord::Base
  validates :title, presence: true
  validates :title, uniqueness: { scope: :author }
end
