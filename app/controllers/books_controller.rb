class BooksController < ApplicationController
  def create
    book = find_or_create_book
    StudentBook.find_or_create_by(
      book_id: book.id,
      student_profile_id: current_profile.id
    )
    redirect_to readings_path
  end

  private

  def find_or_create_book
    if form_includes_author? && book_found_with_no_author?
      book = find_book_by_title
      book.update(author: params[:book][:author])
      book
    elsif !(form_includes_author?)  && book_found_with_author?
      find_book_by_title
    else
      Book.find_or_create_by(book_params)
    end
  end

  def book_found_with_author?
    book_found_by_title? && find_book_by_title.has_author?
  end

  def book_found_with_no_author?
    book_found_by_title? && find_book_by_title.has_no_author?
  end

  def book_found_by_title?
    Book.find_by(title: params[:book][:title])
  end

  def find_book_by_title
    Book.find_by(title: params[:book][:title])
  end

  def form_includes_author?
    params[:book][:author] != ''
  end

  def book_params
    params.require(:book).permit(:title, :author)
  end
end
