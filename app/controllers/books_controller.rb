class BooksController < ApplicationController
  def create
    book = Book.find_or_create_by(book_params)
    StudentBook.find_or_create_by(
      book_id: book.id,
      student_profile_id: current_profile.id
    )
    redirect_to readings_path
  end

  private

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
