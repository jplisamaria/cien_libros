class UserBooksController < ApplicationController
  def index
    @book = Book.new
    @user_book = UserBook.new
  end

end
