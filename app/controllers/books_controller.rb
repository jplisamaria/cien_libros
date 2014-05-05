class BooksController < ApplicationController
  def create
    book = Book.find_or_create_by(book_params)
    user_book = UserBook.find_or_create_by(
      book_id: book.id,
      user_id: current_user.id
    )
    redirect_to readings_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
