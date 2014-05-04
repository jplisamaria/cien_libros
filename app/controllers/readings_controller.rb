class ReadingsController < ApplicationController
  def index
    @book = Book.new
    @reading = Reading.new
 #   @user_books = UserBook.find(id: :current_user.id)
  end

end
