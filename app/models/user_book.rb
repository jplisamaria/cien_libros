class UserBook < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :book, dependent: :destroy
  has_many :readings
end
