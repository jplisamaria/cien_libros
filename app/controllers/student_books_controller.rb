class StudentBooksController < ApplicationController
  def index
    @book = Book.new
    @student_book = StudentBook.new
    redirect_to readings_path
  end
end
