class UserBooksController < ApplicationController
  def index
    @book = Book.new
    @user_book = UserBook.new
    redirect_to readings_path
  end

end
