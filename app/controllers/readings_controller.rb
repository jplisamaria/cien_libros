class ReadingsController < ApplicationController
  def index
    @book = Book.new
    @reading = Reading.new
  end

  def create
    title = params[:reading][:title]
    book = Book.find_by(title: title)
    user_book = UserBook.find_by(book_id: book.id, user_id: current_user.id)
    user_book_id = user_book.id
    reading = Reading.create(reading_params)
    reading.update(user_book_id: user_book_id)
    redirect_to readings_path
  end

  private

  def reading_params
    params.require(:reading).permit(:amount_read)
  end
end
