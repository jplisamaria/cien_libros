class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password_digest, presence: true
  validates :profile_type, presence: true

  delegate :book_list, to: :profile
  belongs_to :profile, polymorphic: true
end
