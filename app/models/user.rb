class User < ActiveRecord::Base
  validates :username, presence: true
  validates :password_digest, presence: true, uniqueness: true

  delegate :book_list, to: :profile
  belongs_to :profile, polymorphic: true
end
